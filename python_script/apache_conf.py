conf_file = "../../../etc/apache2/mods-enabled/dir.conf"

edit_file = open(conf_file, mode="r")
temp = edit_file.readlines()
temp[1] = "DirectoryIndex index.php index.cgi index.pl index.htl index.xhtml index.html\n"
edit_file.close()

edit_file = open(conf_file, mode="w")
edit_file.writelines(temp)
edit_file.close()

