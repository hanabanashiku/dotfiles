autoload -Uz is-at-least

alias glud='git pull origin develop'

function() extractJiraIssue() {
    grep -E -o "\w{3,8}-\d+"
}

function getJiraIssue() {
    command git rev-parse --git-dir &>/dev/null || return

    local from_branch=$(git_current_branch | extractJiraIssue)
    local from_commits=$(git log --no-merges --first-parent --pretty=format:"%s" | extractJiraIssue | head -n 1)

    if [[ -n "$from_commits" ]]; then
        local story_number="$from_commits"
    elif [[ -n "$from_branch" ]]; then
        local story_number="$from_branch"
    fi

    echo "$story_number"
}

function gcamj() {
    if ! command git rev-parse --git-dir &>/dev/null; then
        echo "fatal: not a git repository (or any of the parent directories): .git"
        return -1
    fi

    if [[ $# -eq 2 ]]; then
        local message="$2"
        local story_number=$("$1" | tr '[:lower:]' '[:upper:]')

        if [[ ! "$story_number" =~ ^[A-Z]{3,8}-[0-9]+$ ]]; then
            echo "Invalid JIRA issue: $story_number"
            return -2
        fi
    else
        local message="$1"
        local story_number=$(getJiraIssue | tr '[:lower:]' '[:upper:]')
    fi

    if [[ -n "$story_number" ]]; then
        git commit -am "$story_number $message"
        echo "Resolved issue: $story_number"
    else
        read -p "JIRA issue: " story_number
        git commit -am "$story_number $message"
    fi
}

function gcmsgj() {
    if ! command git rev-parse --git-dir &>/dev/null; then
        echo "fatal: not a git repository (or any of the parent directories): .git"
        return -1
    fi

    if [[ $# -eq 2 ]]; then
        local message="$2"
        local story_number=$("$1" | tr '[:lower:]' '[:upper:]')

        if [[ ! "$story_number" =~ ^[A-Z]{3,8}-[0-9]+$ ]]; then
            echo "Invalid JIRA issue: $story_number"
            return -2
        fi
    else
        local message="$1"
        local story_number=$(getJiraIssue | tr '[:lower:]' '[:upper:]')
    fi

    if [[ -n "$story_number" ]]; then
        git commit -am "$story_number $message"
        echo "Resolved issue: $story_number"
    else
        read -p "JIRA issue: " story_number
        git commit -m "$story_number $message"
    fi
}

function gstam() {
  git stash push -m $1
}

function gstaam() {
  git stash apply $(git stash list | grep -m 1 "$1" | cut -d: -f1)
}
