  GNU nano 7.2                                                extraeips.sh                                                             
#!/bin/bash
# Viernez13
#
# si solo quieres extraer ip de un archivo :
#cat origen | grep -oi "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"|sort >> destino

#ayuda por si no se ponen parametros
if [ -z $1 ];then
    echo -e "Tienes que decirme cual es el archivo de origen y destino con la siguiente sintaxis"
    echo ""
    echo -e "\e[91m./extraeip origen destino\e[0m "
    echo ""
    echo -e "si no pones destino creo el archivo \e[91mlistaips\e[0m en el directorio donde te enchemtras"
exit
else
# readlink nos muestra la ruta completa del archivo.
origen=$(readlink -f $1)
ruta=$(pwd)
# variable en funcion de si se pone o no segundo parametro
if [ -z $2 ];then
    cat $1 | grep -oi "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"|sort >> listaips
    echo -e " \e[92mArchivo de origen          :    \e[91m$origen\e[0m "
    echo -e " \e[92mArchivo destino listado IPs:    \e[91m$ruta/listaips\e[0m "
else
    destino=$(readlink -f $2)
    cat $1 | grep -oi "[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}"|sort >> $2
    echo -e " \e[92mArchivo de origen          :    \e[91m$origen\e[0m "
    echo -e " \e[92mArchivo destino listado IPs:    \e[91m$destino\e[0m "
fi
fi
echo "Gracias por preferir automatizaciòn Viernez13"


