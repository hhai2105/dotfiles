sudo systemctl stop nvidia-suspend.service
sudo systemctl stop nvidia-hibernate.service
sudo systemctl stop nvidia-resume.service

sudo systemctl disable nvidia-suspend.service
sudo systemctl disable nvidia-hibernate.service
sudo systemctl disable nvidia-resume.service
