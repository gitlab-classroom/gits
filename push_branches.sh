list=(12302010030 12302010054 12302010070 12307130250 13300120118 13302010027 13302010028 13302010034 13302010055 13302010058 13302010064 13302010072 13302010077 14302010001 14302010006 14302010011 14302010014 14302010023 14302010024 14302010027 14302010040 14302016001 14302016002 14302016003 14307110253 14307130221 13302010002)

list=it branch | grep -v 'master' | xargs echo

echo Do you want to push branches for: ${list[@]}?
select yn in "yes" "no";
do
	case $yn in
		yes ) break;;
		no ) exit;;
	esac
done

count=0

for i in ${list[@]}
do
	git checkout ${i}
	git push origin ${i}
	count=`expr $count + 1`
	progress=`expr $count \* 100 / ${#list[@]}`
	echo [ ${progress} %]Pushed branch for ${i}.
done

echo ::${#list[@]} branches pushed.
