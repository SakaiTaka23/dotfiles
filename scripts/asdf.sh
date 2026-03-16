tools=(
  golang
  java
  kotlin
  nodejs
  python
)

for tool in "${tools[@]}"; do
  asdf plugin add "${tool}"
done
