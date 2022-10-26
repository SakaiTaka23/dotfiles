tools=(
  golang
  java
  kotlin
  nodejs
  python
  yarn
)

for tool in "${tools[@]}"; do
  asdf plugin add ${tool}
done
