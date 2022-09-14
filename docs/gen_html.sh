#!/bin/bash

func01(){
    cat > ${bb1}/index.html << EOF1

<html>
<body>

EOF1
}
func02(){
    cat >> ${bb1}/index.html << EOF2


<br>
<div Width="95%" style="border:1px dotted RoyalBlue;" >
<br>
<audio controls preload="none" style="width: 95%; margin-bottom: 20px">
<source src="${aa2}" type="audio/mpeg">
${aa4}__${aa3}
</audio>
<br>
<a href="${aa2}" rel="noopener noreferrer"   >${aa4}   :  ${aa3}</a><br>
</div>
<br>


EOF2
}
func03(){
    cat >> ${bb1}/index.html << EOF3

</body>
</html>

EOF3
}
func021(){
    aa4=1
    for aa2 in $(cat  ${aa1} |grep url=\"  |tr ' ' "\n" |grep ^url= |awk -F= '{print $2}'|tr -d \")
    do
        aa3=$(echo ${aa2}|sed -e 's;.*/;;g' -e 's;\.8000\.16000\.mp3;;g')
        func02 
        aa4=$(( ${aa4} + 1 ))
    done
}

bb1=html_laohei
mkdir -p ${bb1}
func01 
for aa1 in laohei2019.mp3.rss laohei2020.mp3.rss laohei2021.mp3.rss laohei2022.mp3.rss
do
    func021 ${aa1}
done
func03


bb1=html_sctv
mkdir -p ${bb1}
for aa1 in sctv2019.mp3.rss sctv2020.mp3.rss sctv2021.mp3.rss sctv2022.mp3.rss
do
    func021 ${aa1}
done

bb1=html_yolo
mkdir -p ${bb1}
for aa1 in yolo2022.mp3.rss
do
    func021 ${aa1}
done

