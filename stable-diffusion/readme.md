[Setup]

/> git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git webui

/> edit webui-user.bat:
	set COMMANDLINE_ARGS=--skip-version-check --skip-torch-cuda-test --disable-nan-check --allow-code --xformers --no-half --medvram
	::  --no-half-vae

/> webui-user.bat
/> Upgrade some python stuff (only if install did not work!!)
	/> .\venv\Scripts\activate
	/> python.exe -m pip install --upgrade pip
	/> pip install xformers

/> edit settings
	- User Interface
		- Quicksettings = sd_model_checkpoint, sd_lora, sd_vae, CLIP_stop_at_last_layers

/> add the following extensions:
	- Works
		- https://github.com/richrobber2/canvas-zoom
		- https://github.com/Mikubill/sd-webui-controlnet
			- Settings = allow_scripts
			- Download models from https://huggingface.co/lllyasviel/ControlNet/tree/main/models
				- Put in folder: stable-diffusion-webui\extensions\sd-webui-controlnet\models
		- https://github.com/fkunn1326/openpose-editor
		- https://github.com/deforum-art/sd-webui-deforum
		- https://github.com/alemelis/sd-webui-ar
		- https://github.com/Bing-su/adetailer
	- Not tested yet
		- https://github.com/d8ahazard/sd_dreambooth_extension
		- https://github.com/thygate/stable-diffusion-webui-depthmap-script
		- https://github.com/AUTOMATIC1111/stable-diffusion-webui-promptgen
		- https://github.com/Iyashinouta/sd-model-downloader
		- https://github.com/kabachuha/sd-webui-text2video
		- https://github.com/volotat/SD-CN-Animation
		- https://github.com/s0md3v/sd-webui-roop
			- Download: https://huggingface.co/lkw99/roop_model/tree/main
			- Save To: <webui_dir>/models/roop/



===================================================================================================

[Prompts]

- Poses:								full body view, full shot, front view, back view, character design, character sheet
- Subject:							Daenerys Targaryen, ((full body)) with silver hair, blue eyes, smiling face
- Scenary: 							walking through (fire:1.2)
- Aspect: 							portrait | digital painting | concept art | realistic illustration | hand drawn | steampunk
- Style: 								anime | hyper-realistic | pop art | modernist | textured | fantasy | surrealist | pixel art | line art
- Artist:								by John Collier | Stanley Artgerm Lau | Frida Kahlo | John Singer Sargent | Alphonse Mucha | Stanley 
- Resolution: 					depth of field | unreal engine | unity | 4K | 8K
- Colour & Lighting: 		cinematic lighting | motion blur | glowing light | backlighting | silhouette | Fujicolor

[Examples]

+: cartoon kid standing in the center of the city road, headphones, no companion, female, octane render, 8k

+: facing camera, character, female, pirate, angry face, red jacket, blue leggings, brown boots, no companion, green background, no shadow, octane render, 8k

+: (comic book art style), (Soap-Committee on ArtStation art style), full body view, full shot, front view, back view, character design, character sheet, medieval peasant woman, blonde hair, green eyes, strong highlights, sharp outlines, sharp shadows, 8k, high quality, solid white background, (cell shading).
-: low quality, unrealistic, ugly, distorted, deformed, mutated, mutated hands, nude, doll, plastic, close up, closeup, half body, bad proportions, Japanese, Korean
