[version | info]
ffmpeg -version

[Split video by duration]

\> ffmpeg.exe -i "pexels-cottonbros-4594927.mp4" -ss 00:00:00.0 -t 4 -vcodec copy -acodec copy "cottonbros-video-slits\split-000.mp4"

[Extract images from video]

\> ffmpeg.exe -i "pexels-allan-mas-5362370 (2160p).mp4" -r 16 "frames-input\$filename%04d.png"

\> ffmpeg.exe -i "pexels-cottonbros-4594927.mp4" -r 30 -pix_fmt rgb24 "cottonbros-video-images\$filename%04d.png"
\> ffmpeg.exe -i "pexels-cottonbros-4594927.mp4" -r 15 -vf "mpdecimate" -pix_fmt rgb24 "cottonbros-video-images\$filename%04d.png"

[Upscale the images]

\> ffmpeg.exe -i "cottonbros-video-images\%03d.png" -vf "scale=w=512:h=768:force_original_aspect_ratio=decrease" "cottonbros-image-upscaled\$filename%03d.png"
\> ffmpeg.exe -i "cottonbros-video-images\%03d.png" -vf "scale=w=512:h=768:force_original_aspect_ratio=decrease,pad=512:768:(ow-iw)/2:(oh-ih)/2" "cottonbros-image-upscaled\$filename%03d.png"

[Concat frames to video]

\> ffmpeg.exe -y -i "cottonbros-auto1111-images\%04d.png" -r 16 -pix_fmt yuv420p -b:v 12M -strict -2 "pexels-cottonbros-finalcut.mp4"

\> ffmpeg.exe -i "cottonbros-auto1111-images\%03d.png" -pix_fmt yuv420p -r 30 -c:v libx264 "pexels-cottonbros-finalcut.mp4"
\> ffmpeg.exe -i "cottonbros-auto1111-images\%03d.png" -pix_fmt yuv420p -r 30 -c:v libx264 -vf "scale=-2:'min(720,ih)'" "pexels-cottonbros-finalcut.mp4"

:: slow it down
ffmpeg.exe -i "artem-podrez-auto1111-images\%04d.png" -pix_fmt yuv420p -filter:v "setpts=2*PTS"-c:v libx264 "pexels-artem-podrez-finalcut.mp4"