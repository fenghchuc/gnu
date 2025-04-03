

reset
set terminal eps size 5, 3 font 'Linux Libertine O,25' 
set output sprintf("%s/graphs/b.eps", directory_path)

set xrange [-0.5:7.5]
set yrange [7.5:-0.5]

set xtics offset -0.2,0.6,0 font 'Linux Libertine O,25' ("5" 0, "10" 1, "25" 2, "50" 3, "75" 4, "100" 5, "150" 6, "200" 7)
set ytics offset 0.3,0,0 font 'Linux Libertine O,25' ("1000" 0, "750" 1, "500" 2, "250" 3, "100" 4, "50" 5, "20" 6, "10" 7)
set cbtics offset -0.5,0.1,0 font 'Linux Libertine O,25' ("-15" -15, "0" 0, "15" 15, "30" 30, "45" 45, "60" 60)

set tics nomirror out scale 0.5

set xlabel offset 0,1.2,0 font 'Linux Libertine O,25' "RTT (ms)"
set ylabel offset 1,0,0 font 'Linux Libertine O,25' "Bandwidth (Mbps)"

do for [i=0:7] {
    set arrow from i-0.5,-0.5 to i-0.5,7.5 nohead lc rgb 'black' lw 2 front
}
do for [j=0:7] {
    set arrow from -0.5,j-0.5 to 7.5,j-0.5 nohead lc rgb 'black' lw 2 front
}

unset key

set lmargin 7.5
set rmargin 1
set tmargin 0.6
set bmargin 2.1

set palette defined ( 0 "#97f0fc",\
                      1 "#c7f8ff",\
                      2 "#ecfcfe",\
                      3 "#ffffff",\
                      4 "#f5dbd6",\
                      5 "#f2bab0",\
                      6 "#f59e8e",\
                      7 "#ee7c68",\
                      8 "#e96149",\
                      9 "#ea462a",\
                      10 "#ff2600",\
                      11 "#d42202",\
                      12 "#a81900")

plot sprintf("%s/distilled_data/test.distilled", directory_path) matrix with image ,\
     '' matrix using 1:2:(sprintf('%d', $3)) with labels font 'Linux Libertine O,25' textcolor rgb 'black'

