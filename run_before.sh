# Anything in here will be ran before everything else (run_before.sh -> main devconf.py -> run_after.sh)

# Rust compiler (https://www.rust-lang.org/)
echo "Installing rust and cargo.."
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | bash -s -- -y > /dev/null 2>&1
