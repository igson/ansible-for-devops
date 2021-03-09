 # Garantindo as chaves
    KEY_PATH='/vagrant/provision/files'
    mkdir -p /root/.ssh
    cp $KEY_PATH/key /root/.ssh/id_rsa
    cp $KEY_PATH/key.pub /root/.ssh/id_rsa.pub
    cp $KEY_PATH/key.pub /root/.ssh/authorized_keys
    chmod 400 /root/.ssh/id_rsa*
    cat /root/.ssh/id_rsa.pub >> /home/vagrant/.ssh/authorized_keys

    # Garantindo os hosts
    HOSTS=$(head -n7 /etc/hosts)
    echo -e "$HOSTS" > /etc/hosts
    echo '10.46.60.4 db.4labs.example' >> /etc/hosts
    echo '10.46.60.5 app1.4labs.example' >> /etc/hosts
    echo '10.46.60.6 app2.4labs.example' >> /etc/hosts
    