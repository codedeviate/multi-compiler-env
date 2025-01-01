wget http://downloads.sourceforge.net/project/freepascal/Linux/3.2.2/fpc-3.2.2.arm-linux-on-aarch64.tar
tar -xvf fpc-3.2.2.arm-linux-on-aarch64.tar

mkdir fpc-3.2.2.arm-linux
cd fpc-3.2.2.arm-linux

whoami

echo 'echo ""' > answers.sh
echo 'echo ""' >> answers.sh
echo 'echo ""' >> answers.sh
echo 'echo ""' >> answers.sh

chmod +x answers.sh

./answers.sh | ./install.sh
cd ..

echo 'export PATH="$HOME/fpc/bin:$PATH"' >> ~/.bash_profile
export PATH="$HOME/fpc/bin:$PATH"

rm fpc-3.2.2.arm-linux-on-aarch64.tar
# rm -rf rm fpc-3.2.2.arm-linux
