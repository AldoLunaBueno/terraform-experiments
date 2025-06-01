mkdir -p "${repo_path}"
cd "${repo_path}"
git init
git config user.name "${repo_author}"
git config user.email "${repo_email}"
echo "Author: ${repo_author}" > README.md
git add .
git commit -m "First Commit"
git log

%{ for directory in split(",", repo_directories)}
    mkdir -p "${directory}"
%{ endfor }