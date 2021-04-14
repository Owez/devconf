# autoinstaller

packages=(
	"curl"
	"firefox"
	"code"
)

for package in ${packages[@]}
do
	sudo pacman --noconfirm -S $package
done

# ohmyzsh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
