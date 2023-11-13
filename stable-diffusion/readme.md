[Setup]

/> Machine
	- Disk Space = 500GB
	- Mem = 64 GB
	- GPU = RTX 4090 24GB
	- SystemPropertiesAdvanced.exe

/> Start here:
	- https://github.com/AUTOMATIC1111/stable-diffusion-webui
	- https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Features

/> Git
	- https://git-scm.com/download/win
	- where git
	- git -v

/> Python
	- https://www.python.org/downloads/release/python-31013
	- where python
	- python -V

/> FFmpeg
	- https://ffmpeg.org/download.html
	- where ffmpeg
	- ffmpeg -version

/> EbSynth
	- https://ebsynth.com


/> WebUI
	git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui webui

/> edit webui-user.bat:
	set COMMANDLINE_ARGS=--skip-version-check --allow-code --xformers

/> webui-user.bat
	http://127.0.0.1:7860

/> Upgrade some python stuff (only if install did not work!!)
	/> .\venv\Scripts\activate.bat
	/> python.exe -m pip install --upgrade pip
	/> pip install xformers
	/> pip install gfpgan
	/> pip install realesrgan

/> Create the following folders:
	<webui_dir>\models\LyCORIS

/> checkpoints
	- Save into: <webui_dir>\models\Stable-diffusion
		- SD-2.0 (512x512): https://huggingface.co/stabilityai/stable-diffusion-2-base/tree/main (512-base-ema.safetensors)
		- SD-2.0 (512x512): https://huggingface.co/webui/stable-diffusion-2-inpainting/tree/main (512-inpainting-ema.safetensors)
		- SD-2.0 (768x768): https://huggingface.co/stabilityai/stable-diffusion-2/tree/main (768-v-ema.safetensors)
		- SD-2.1 (768x768): https://huggingface.co/webui/stable-diffusion-2-1/tree/main (v2-1_768-ema-pruned.safetensors)
		- SD-XL (1024×1024): https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/tree/main (sd_xl_base_1.0_0.9vae.safetensors)
		- SD-1.5 (512x512): https://civitai.com/models/94809/realcartoon3d (realcartoon3d_v8.safetensors)

/> refiners
	- SDXL (1024×1024): https://huggingface.co/stabilityai/stable-diffusion-xl-refiner-1.0/tree/main (sd_xl_refiner_1.0_0.9vae.safetensors)

/> vae's (Variable Auto Encoder)
	- Save into: <webui_dir>\models\VAE
		- SD-1.5: https://huggingface.co/stabilityai/sd-vae-ft-ema-original/tree/main (vae-ft-ema-560000-ema-pruned.safetensors)
		- SD-1.5: https://huggingface.co/stabilityai/sd-vae-ft-mse-original/tree/main (vae-ft-mse-840000-ema-pruned.safetensors)
		- SD-XL: https://huggingface.co/stabilityai/sdxl-vae/tree/main (sdxl_vae.safetensors)
		- SD-1.5: https://huggingface.co/ckpt/anything-v4.5-vae-swapped/tree/main (anything-v4.5-vae-swapped.safetensors)
		- SD-1.5: https://huggingface.co/WarriorMama777/OrangeMixs/tree/main/VAEs (orangemix.vae.pt)
		- SD-1.5: https://huggingface.co/NoCrypt/blessed_vae/tree/main (blessed2.vae.pt)

/> embeddings
	- Save into: <webui_dir>\embeddings
		- https://civitai.com/models/7808/easynegative
		- https://civitai.com/models/116230/bad-hands-5

/> upscalers
	- https://openmodeldb.info/models/4x-UltraSharp
		- Into <webui_dir>\models\ESRGAN\ folder

/> scripts
	- https://rentry.co/sd-loopback-wave
	- https://xanthius.itch.io/multi-frame-rendering-for-stablediffusion


/> add the following extensions:
	- Yes
		- https://github.com/alemelis/sd-webui-ar (Aspect Ratio selector)
		- https://github.com/richrobber2/canvas-zoom (Canvas Zoom)
		- https://github.com/jtydhr88/sd-webui-txt-img-to-3d-model (Txt/Img to 3D Model)
		- https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg (RemBG)
			- Remove pinned version from: <webui_dir>\extensions\stable-diffusion-webui-rembg\install.py
		- https://github.com/Bing-su/adetailer (!After Detailer)
		- https://github.com/Mikubill/sd-webui-controlnet (ControlNet)
			- Settings
				- Allow other scripts to control this extension = checked
			- Download models from
				- https://huggingface.co/h94/IP-Adapter
				- https://huggingface.co/lllyasviel/ControlNet-v1-1/tree/main
				- https://huggingface.co/lllyasviel/sd_control_collection/tree/main
				- https://huggingface.co/ioclab/ioc-controlnet/tree/main/models
				- https://huggingface.co/CiaraRowles/TemporalNet/tree/main
					- cldm_v15.yaml ---> control_sd15_temporalnet_fp16.yaml
					- diffusion_pytorch_model.fp16.safetensors ---> control_sd15_temporalnet_fp16.safetensors
				- https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster/tree/main (safetensors + yaml)
				- Put in folder: <webui_dir>\extensions\sd-webui-controlnet\models\
			- DW OpenPose
				- https://github.com/IDEA-Research/DWPose (install from URL)
		- https://github.com/pharmapsychotic/clip-interrogator-ext (Clip Interrogator)
		- https://github.com/tjm35/asymmetric-tiling-sd-webui (Asymmetric Tiling)
		- https://github.com/hako-mikan/sd-webui-regional-prompter (Regional Prompter)
		- https://github.com/fkunn1326/openpose-editor (OpenPose Editor)
		- https://github.com/CiaraStrawberry/TemporalKit (TemporalKit)
			- https://pypi.org/project/tqdm
			- https://github.com/CiaraStrawberry/TemporalKit/issues/81
				- .\venv\Scripts\activate.bat
				- pip install -U tqdm
				- .\venv\Scripts\deactivate.bat
		- https://github.com/deforum-art/deforum-for-automatic1111-webui (Deforum)
		- https://github.com/v8hid/infinite-zoom-automatic1111-webui (Infinite Zoom)
		- https://github.com/thygate/stable-diffusion-webui-depthmap-script (DepthMap Script)
			https://www.nextdiffusion.ai/tutorials/create-3d-zoom-animations-stable-diffusion-depth-map-extension
		- https://github.com/Kahsolt/stable-diffusion-webui-prompt-travel (Prompt Travel)
		- https://github.com/continue-revolution/sd-webui-animatediff (Animatediff)
		- https://github.com/OpenTalker/SadTalker (SadTalker)
			- Save To: <webui_dir>\extensions\SadTalker\checkpoints\
			- Ref: https://github.com/OpenTalker/SadTalker/blob/main/scripts/download_models.sh
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2/BFM_Fitting.zip (unzip it)
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2/epoch_20.pth
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2/wav2lip.pth
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2/auido2exp_00300-model.pth
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2/auido2pose_00140-model.pth
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2/facevid2vid_00189-model.pth.tar
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00109-model.pth.tar
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/mapping_00229-model.pth.tar
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_256.safetensors
				- https://github.com/OpenTalker/SadTalker/releases/download/v0.0.2-rc/SadTalker_V0.0.2_512.safetensors
	- Never
		- https://github.com/s0md3v/sd-webui-roop (Conflicts with Remove Background extension)
			- Download: https://huggingface.co/lkw99/roop_model/tree/main (inswapper_128.onnx)
			- Save To: <webui_dir>\models\roop\
		- https://github.com/continue-revolution/sd-webui-animatediff (Compatibility issues with ControlNet)
	- Not tested yet
		- https://nmkd.de/?esrgan (4x/8x Superscale)
		- https://github.com/hako-mikan/sd-webui-regional-prompter
		- https://github.com/camenduru/stable-diffusion-webui-artists-to-study
		- https://github.com/d8ahazard/sd_dreambooth_extension
		- https://github.com/volotat/SD-CN-Animation
		- https://github.com/GeorgLegato/stable-diffusion-webui-vectorstudio


/> edit settings
	- img2img
		- Apply color correction to img2img = unchecked
		- With img2img, do exactly the amount of steps as the slider = checked
		- Extra noise multiplier for img2img and hires fix = 0.1 (less than denoising strength)
	- Optimizations
		- Pad prompt/negative prompt to be the same length = checked
	- User Interface
		- Quicksettings = sd_model_checkpoint, sd_lora, sd_vae, CLIP_stop_at_last_layers, initial_noise_multiplier, inpainting_mask_weight
	- Extra Networks
		- Always show all networks on the LoRA page = checked
	- Deforum
		- FFmpeg path = C:\_QS\Programs\FFmpeg\6.0\bin\ffmpeg.exe
	- ControlNet
		- Multi-ControlNet unit number = 3
		- Model cache size = 3
		- Do not append detectmap to output = checked
		- Allow detectmap auto saving = checked
		- Allow other scripts to control this extension = checked


===================================================================================================

https://cdn.openart.ai/assets/Stable%20Diffusion%20Prompt%20Book%20From%20OpenArt%2011-13.pdf
https://dallery.gallery/wp-content/uploads/2022/07/The-DALL%C2%B7E-2-prompt-book-v1.02.pdf

https://www.artvy.ai/styles
https://www.youtube.com/watch?v=9H0oOexrupY
https://promptomania.com/generic-prompt-builder
https://supagruen.github.io/StableDiffusion-CheatSheet
https://github.com/ahgsql/StyleSelectorXL
https://github.com/Dalabad/stable-diffusion-prompt-templates
https://huggingface.co/hollowstrawberry/stable-diffusion-guide/blob/main/README.md
https://www.nextdiffusion.ai/tutorials/prompt-editing-in-stable-diffusion-merging-images-seamlessly
https://stable-diffusion-art.com/how-to-come-up-with-good-prompts-for-ai-image-generation/#Some_good_keywords_for_you
https://www.reddit.com/r/StableDiffusion/comments/xxgy8j/any_tricks_for_having_multiple_people_in_one/

https://github.com/XingangPan/DragGAN


[Prompts]

- Material:				pencil | chalk | ink | paint | origami | mosaic | pottery | clay | glass | wood carving | cloth
- Medium:				concept art | illustration | sketch | drawing | line art | oil painting | hand drawn | steampunk
- Style: 				anime | chibi | pixel art | line art | kinetic art | pop art | ultra realistic | textured | fantasy | surrealist | gothic
- Display:
	- Scenes:			photo | portrait | landscape | photography | bokeh | dof | cinematic | film | character sheet
	- Film Types:		dslr | fujifilm | polariod | 35mm
	- Perspective:		full body shot | wide angle | top-view | aerial view | close-up | cowboy shot | low angle | high angle | isometric
	- Resolution:		4K | 8K | 16K | 32K
- Subject:				Daenerys Targaryen, silver hair, blue eyes, smiling face, walking through fire
- Color & Lighting:		silhouette | accent lighting, ambient lighting, backlight, blacklight, blinding light, candlelight, concert lighting,
						crepuscular rays, direct sunlight, dusk, Edison bulb, electric arc, fire, fluorescent, glowing, glowing radioactively,
						glow-stick, lava glow, moonlight, natural lighting, neon lamp, nightclub lighting, nuclear waste glow, quantum dot display,
						spotlight, strobe, sunlight, ultraviolet, dramatic lighting, dark lighting, soft lighting, gloomy
- Artist:				by John Collier | by Stanley Artgerm Lau | by Frida Kahlo | by John Singer Sargent | by Alphonse Mucha | by Artgerm
- Website:				trending on pixiv | trending on pixabay | trending on artstation


[Examples]

- Cyborg Man/Woman
	- Medium:					concept art
	- Style: 					realistic, fantasy
	- Display:					bokeh, 8K, hdr
	- Poses:					(full body:1.3), (contrapposto:1.3), standing on street stones
	- Subject:					1 man, solo, cyborg, short blond hair, glowing red eyes, white and gold body, orange and white body, engraving body, mech boots, detailed pipes, battle scene
	- Colour & Lighting: 		cinematic lighting, glowing light
	- Additional Context:		sci-fi
	- Negative Context:			NSFW, FastNegativeV2, BadDream, UnrealisticDream, bad-hands-5, people
	- Generation Details:		Size: 768x1024, Model: protovisionXLHighFidelity3D_beta0520Bakedvae, Sampler: DPM++ 2M SDE Karras, Steps: 30, CFG: 7, Clip skip: 2

- Camo Mech Suit
	- Medium:					portrait
	- Style: 					realistic, fantasy
	- Display:					bokeh, 8K, hdr
	- Poses:					medium shot
	- Subject:					1 woman, solo, transparent camo mech suit, ((translucent) liquid water [rust]), rain, in forest
	- Colour & Lighting: 		soft lighting, vibrant colors
	- Additional Context:		elegant, sharp focus, photo by greg rutkowski
	- Negative Context:			NSFW, FastNegativeV2, BadDream, UnrealisticDream, bad-hands-5, people, helmet
	- Generation Details:		Size: 768x1024, Model: protovisionXLHighFidelity3D_beta0520Bakedvae, Sampler: DPM++ 2M Karras, Steps: 30, CFG: 7, Clip skip: 2

- Futuristic Illustration
	- Medium:					illustration
	- Style: 					realistic
	- Display:					bokeh, 8K, hdr
	- Poses:					(full body:3)
	- Subject:					1 girl, solo, standing in street, long hair, black hair, mobile suit, mecha, small breasts, looking at viewer, (blue eyes:1.3), bangs, closed mouth, covered navel, skintight, kicking, red skirt, long shoes, long cape, leg armor:1.5, white thigh highs
	- Colour & Lighting: 		cinematic lighting
	- Additional Context:		sci-fi
	- Negative Context:			NSFW, FastNegativeV2, BadDream, UnrealisticDream, bad-hands-5, people
	- Generation Details:		Size: 768x1024, Model: protovisionXLHighFidelity3D_beta0520Bakedvae, Sampler: DPM++ 2M Karras, Steps: 25, CFG: 7, Clip skip: 2

[Other Examples]

- Neg: duo, couple

- A distant galaxy filled with tiny colorful stars, a blue, Earth-like planet in the foreground, realistic, colorful, 8k, trending on artstation.

- [strawberry : skeleton face:25] hanging from a tree

- (best quality, masterpiece, perfect face), raw photo of a [sexy slender woman: (skeleton:1.2) :12], solo, full body shot, short black dress, (hyper realism, soft light, dramatic light, sharp, HDR), 8K

- side view portrait, 1man (tall, trim, fit 50 year old man, grey beard, wearing a completely unbottoned grey casual blazer, dark brown oxford shoes, black satin shirt, dark blue denim pants ) and 1girl (18 year old, caucasian, american girl, wavy brown hair with golden highlights, smiling flirtatiously, wearing red Cut Out Halter Backless Ruched Mini Party Dress) facing each other while standing in front of bar at resturant