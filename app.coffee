Framer.Extras.Preloader.enable()
Framer.Extras.Hints.disable()

Framer.Defaults.Layer.style = 
	fontFamily: "arial rounded mt bold"
# 	fontWeight: 400
Framer.Defaults.Animation = 
	time: 0.3
	curve: "ease"

Canvas.backgroundColor = "hsl(190,40%,85%)"

# =========================== 


canvas_frame_ratio = Canvas.frame.width / Screen.width
web_ratio = Framer.Device.screen.width / 375
canvas_frame_ratio = 1
# canvas_frame_ratio = web_ratio
# print canvas_frame_ratio
# print Canvas.frame.width
# print Framer.Device.screen.width
# print Framer.Device.screen.y

# print web_ratio

getEventPoint = (event) ->
	myTouchEvent = Events.touchEvent(event)
# 	print myTouchEvent.contextPoint.x
	touchX = myTouchEvent.clientX / canvas_frame_ratio
	touchY = myTouchEvent.clientY / canvas_frame_ratio
	
	if Utils.isDesktop()
		touchX = myTouchEvent.point.x * 1
		touchY = myTouchEvent.point.y * 1
	
	point = {x:touchX,y:touchY}
	return point



circle_vis = false
circle_vis = true
circle_size = 44

circle = new Layer
	size: circle_size
	borderRadius: circle_size/2
	backgroundColor: "rgba(255,255,255,1)"
	shadow1: 
		blur: 10
		color: "rgba(0,0,0,0.1)"
	opacity: 0
# 	visible: false
	z: 10

if circle_vis is false
	circle.visible = false


Framer.Device.screen.onTouchStart (event) ->
	if circle_vis is false
		circle.visible = false
	else
		circle.visible = true

	point = getEventPoint event
	circle.midX = point.x / 3
	circle.midY = point.y / 3
	circle.opacity = 0.6
# 	circle.animate time: .01, properties: scale: 1, opacity: 0.7, midX: point.x, midY: point.y
	circle.bringToFront()


Framer.Device.screen.onTouchMove (event) ->
	point = getEventPoint event
	circle.midX = point.x / 3
	circle.midY = point.y / 3
	
Framer.Device.screen.onTouchEnd (event) ->
	circle.animate time: .15, delay: .1, curve: "ease-out", properties: scale: .8, opacity: 0


# --------------------------------------

safe_area_top = 0
safe_area_bottom = 0


sticker_picker_img = "images/sticker_picker.jpg"


screen_ratio = Screen.height/Screen.width

iPhoneX_related_ratio_array = [812/375, 896/414, 844/390, 926/428]
# print Math.floor(r*100) for r in iPhoneX_related_ratio_array
iPhoneX_related_ratio = Math.floor(812/375*100)

# if screen_ratio is 812/375 or screen_ratio is 896/414 or screen_ratio is 844/390
if Math.floor(screen_ratio*100) is iPhoneX_related_ratio
	safe_area_top = 44
	safe_area_bottom = 34
	screen_width = Screen.width
	screen_height = Screen.height - safe_area_top - safe_area_bottom
else
	safe_area_top = 0
	safe_area_bottom = 0
	screen_width = Screen.width
	screen_height = Screen.height

screen_y = safe_area_top

nav_h = 44



screen_y = safe_area_top
screen_maxY = screen_y + screen_height


nav_h = 88/2

# --------------------------------------


# =========================== 

bouncing_ani = (card) ->
	ori_scale = card.scale
	bouncing_ani_a = new Animation
		layer: card
		properties:
			scale: ori_scale * 1.06
			brightness: 110
		curve: "spring(400,20,0)"
		time: 0.1

	bouncing_ani_b = new Animation
		layer: card
		properties:
			scale: ori_scale
			brightness: 100
		curve: "spring(400,20,0)"
		time: 0.1
	
	bouncing_ani_a.start()
	Utils.delay 0.1, ->
		bouncing_ani_b.start()

press_effect = (btn) ->
	btn_press = 0
	btn.onTouchStart ->
		@.animate (brightness: 90, scale: 0.9)
		btn_press = 1

	btn.onTouchMove ->
		@.animate (brightness: 100, scale: 1)
		btn_press = 0

	btn.onTouchEnd ->
		@.animate (brightness: 100, scale: 1)
		if btn_press is 1
			btn_press = 0
	
	btn.states.animationOptions =
		time: 0.3
		curve: "spring(400,20,0)"

press_effect_dark = (btn) ->
	btn_press = 0
	btn.onTouchStart ->
		@.animate (brightness: 80)
		btn_press = 1

	btn.onTouchMove ->
		@.animate (brightness: 100)
		btn_press = 0

	btn.onTouchEnd ->
		@.animate (brightness: 100)
		if btn_press is 1
			btn_press = 0
	
	btn.states.animationOptions =
		time: 0.3
		curve: "ease"

press_effect_dark_2 = (btn) ->
	btn_press = 0
	btn.onTouchStart ->
		@.animate (backgroundColor: "hsla(0,0%,60%,1)")
		btn_press = 1

	btn.onTouchMove ->
		@.animate (backgroundColor: "hsla(0,0%,60%,0)")
		btn_press = 0

	btn.onTouchEnd ->
		@.animate (backgroundColor: "hsla(0,0%,60%,0)")
		if btn_press is 1
			btn_press = 0
	
	btn.states.animationOptions =
		time: 0.3
		curve: "ease"

# ===========================

sec2time = (timeInSeconds) ->
	pad = (num, size) ->
		('000' + num).slice size * -1

	time = parseFloat(timeInSeconds).toFixed(3)
	hours = Math.floor(time / 60 / 60)
	minutes = Math.floor(time / 60) % 60
	seconds = Math.floor(time - (minutes * 60))
	milliseconds = time.slice(-3)
# 	pad(hours, 2) + ':' + pad(minutes, 2) + ':' + pad(seconds, 2) + ',' + pad(milliseconds, 3)
	pad(minutes, 1) + ':' + pad(seconds, 2)


# ===========================


canvas_frame_ratio = Canvas.frame.width / Screen.width

circle_vis = false
circle_size = 40

circle = new Layer
	size: circle_size
	borderRadius: circle_size/2
	backgroundColor: "rgba(255,255,255,1)"
	shadow1: 
		blur: 10
		color: "rgba(0,0,0,0.1)"
	opacity: 0
	visible: false
	z: 11

if circle_vis is false
	circle.visible = false


Framer.Device.screen.onTouchStart (event) ->
	if circle_vis is false
		circle.visible = false
	else
		circle.visible = true

	point = getEventPoint event
	circle.midX = point.x
	circle.midY = point.y
	circle.animate time: .01, properties: scale: 1, opacity: 0.7, midX: point.x, midY: point.y
	circle.bringToFront()


Framer.Device.screen.onTouchMove (event) ->
	point = getEventPoint event
	circle.midX = point.x
	circle.midY = point.y
	
Framer.Device.screen.onTouchEnd (event) ->
	circle.animate time: .15, delay: .1, curve: "ease-out", properties: scale: .8, opacity: 0


getEventPoint = (event) ->
	myTouchEvent = Events.touchEvent(event)
	touchX = myTouchEvent.clientX / canvas_frame_ratio
	touchY = myTouchEvent.clientY / canvas_frame_ratio
	point = {x:touchX,y:touchY}
	return point



# ===========================

# "icon_tab_length.png"

data_tab_images = [
	{
		active: "icon_tab_style.png",
		unactive: "icon_tab_style_disable.png",
		text: "Style"
	},
	{
		active: "icon_tab_edit.png",
		unactive: "icon_tab_edit_disable.png",
		text: "Trim "
	},
	{
		active: "icon_tab_layout.png",
		unactive: "icon_tab_layout_disable.png",
		text: "Layout"
	},
	{
		active: "icon_tab_canvas.png",
		unactive: "icon_tab_canvas_disable.png",
		text: "Canvas"
	},
	{
		active: "icon_tab_frame.png",
		unactive: "icon_tab_frame_disable.png",
		text: "Frame"
	},
	{
		active: "icon_tab_music.png",
		unactive: "icon_tab_music_disable.png",
		text: "Music"
	},
	{
		active: "icon_tab_filter.png",
		unactive: "icon_tab_filter_disable.png",
		text: "Filter"
	},
	{
		active: "icon_tab_transition.png",
		unactive: "icon_tab_transition_disable.png",
		text: "Transition"
	}
]
	



# DATA
clips = [
	{
		name: "clip_1",
		duration: 6,
		highlight: [2,4],
# 		image: "https://picsum.photos/id/1010/200/200",
# 		image: "images/1010.jpg",
		image_hd: "images/input/hd/human_1.jpg",
		image: "images/input/human_1.jpg",
		page: 0
	},
	{
		name: "clip_2",
		duration: 8,
		highlight: [2,4]
# 		image: "https://picsum.photos/id/1011/200/200"
# 		image: "images/1011.jpg",
		image_hd: "images/input/hd/human_2.jpg",
		image: "images/input/human_2.jpg",
		page: 0
	},
	{
		name: "clip_3",
		duration: 10,
		highlight: [4,5],
# 		image: "https://picsum.photos/id/1012/200/200"
# 		image: "images/1012.jpg",
		image_hd: "images/input/hd/human_3.jpg",
		image: "images/input/human_3.jpg",
		page: 0
	},
	{
		name: "clip_4",
		duration: 8,
		highlight: [1,3],
# 		image: "https://picsum.photos/id/1014/200/200"
# 		image: "images/1014.jpg",
		image_hd: "images/input/hd/human_4.jpg",
		image: "images/input/human_4.jpg",
		page: 0
	},
	{
		name: "clip_5",
		duration: 9,
		highlight: [4,6],
# 		image: "https://picsum.photos/id/1015/200/200"
# 		image: "images/1015.jpg",
		image_hd: "images/input/hd/human_5.jpg",
		image: "images/input/human_5.jpg",
		page: 0
	}
]


highlight_gradient = new Gradient
	start: "#F16F8D"
	end: "#F78C71"

colors = ["7876BE","F9CC73","EA8099"]
# colors = ["69B4A2","F9CC73","EA8099"]

cta_color = "7876BE"

for c in [0...clips.length]
	n = c%colors.length
	clips[c].color = colors[n]


layout_data = [
	[
		[0.1,0.1,0.8,0.8],
	],
	[
		[0.1,0.1,0.8,0.8],
	],
	[
		[0.1,0.1,0.8,0.8],
	],
	[
		[0.1,0.1,0.8,0.8],
	],
	[
		[0.1,0.1,0.8,0.8],
	]
]

# layout_data = [
# 	[
# 		[0.2,0.2,0.6,0.6],
# 	],
# 	[
# 		[0.1,0.1,0.8,0.4]
# 		[0.2,0.6,0.58,0.3]
# 	],
# 	[
# 		[0.1,0.1,0.6,0.3],
# 		[0.3,0.5,0.6,0.4]
# 	]
# ]


page_data = []

p_scale = 1

page_array = []
slot_array = []
slot_obj_array = []

isShowSlotBorder = false

create_pages = ( p ) ->	
	for i in [0...layout_data.length]
		n = i%colors.length
		page = new Layer
			parent: p
			size: p.size
			width: p.width * p_scale
			height: p.height * p_scale
			x: 0
			y: 0
			backgroundColor: "hsl(10,20%,80%)"
			borderWidth: 0
			borderColor: colors[n]
			index: i
			
		page_array.push(page)
		
		for j in [0...layout_data[i].length]
			slot = new Layer
				parent: page
				x: p.width * layout_data[i][j][0] * p_scale
				y: p.height * layout_data[i][j][1] * p_scale
				width: p.width * layout_data[i][j][2] * p_scale
				height: p.height * layout_data[i][j][3] * p_scale
				backgroundColor: colors[n]
# 				image: "#{clips[i].image}"
				index: j
				clip: true
			
			slot_array.push(slot)

			slot_obj = new Layer
				parent: slot
				size: slot.size
				index: j
			
			slot_obj_array.push(slot_obj)


update_pages = ->
	for i in [0...page_array.length]
		page_array[i].size = page_array[i].parent.size
		page_array[i].x = 0
		page_array[i].y = 0
# 		page_array[i].borderColor = "black"
		for j in [0...page_array[i].children.length]
			page_array[i].children[j].x = layout_data[i][j][0] * p_scale * page_array[i].width
			page_array[i].children[j].y = layout_data[i][j][1] * p_scale * page_array[i].height
			page_array[i].children[j].width = layout_data[i][j][2] * p_scale * page_array[i].width
			page_array[i].children[j].height = layout_data[i][j][3] * p_scale * page_array[i].height
			for k in [0...page_array[i].children[j].children.length]
				page_array[i].children[j].children[k].x = 0
				page_array[i].children[j].children[k].y = 0
				page_array[i].children[j].children[k].width = layout_data[i][j][2] * p_scale * page_array[i].width
				page_array[i].children[j].children[k].height = layout_data[i][j][3] * p_scale * page_array[i].height


update_color_data = ->
	new_colors = []
	page_num_array = []
	for i in [0...layout_data.length]
		n = i%colors.length
		for j in [0...layout_data[i].length]
			new_colors.push(colors[n])
			color = new Color(colors[n])
			if layout_data[i].length > 1
				k = layout_data[i].length - 1 
# 				color_2 = new Color(colors[n])
# 				color_2 = layout_data[i][k]
# 				print layout_data[i][k]

			page_num_array.push(i)
	
	colors = new_colors
	
	for i in [0...clips.length]
		clips[i].color = colors[i]
		clips[i].page = page_num_array[i]
		

update_color_data()



update_page_slot = ->
	for i in [0...slot_array.length]
		slot_array[i].image = "#{clips[i].image}"
		slot_array[i].borderColor = clips[i].color
		
		slot_obj_array[i].image = "#{clips[i].image_hd}"
# 		slot_array[i].borderColor = clips[i].color

# for c in [0...clips.length]
# 	print clips[c].color
# 	n = c%colors.length
# 	clips[c].color = colors[n]

clips_highlights_ori = [[2, 4], [2, 4], [4, 5], [1, 3], [4, 6]] # 12: 2 3 2 1 2
clips_highlights_15 = [[1, 4], [2, 4], [3, 7], [1, 4], [4, 7]] # 15: 3 2 3 3 3
clips_highlights_20 = [[1, 5], [1, 5], [3, 6], [0, 5], [3, 7]] # 15: 3 3 3 3 3


# ===========================

get_highlight_total = ->
	highlight_total = 0
	for i in [0...clips.length]
		clip_highlight = clips[i].highlight[1] - clips[i].highlight[0]
# 		highlight_total_array.push(clip_highlight)
		highlight_total += clip_highlight
	return highlight_total	


editor_page_w = Screen.width
editor_page_h = Screen.height

editor_page = new Layer
	width: editor_page_w
	height: editor_page_h
	backgroundColor: "hsl(0,0%,93%)"
	

nav_h = 36

option_area_h = 162
preview_area_w = Screen.width
preview_area_h1 = preview_area_w * 1 - nav_h
preview_area_h2 = 16*2+24+366
preview_area_h = preview_area_h1

clip_editor_y_high = Screen.height * 0.516 # 419
clip_editor_y_mid = Screen.height * 0.628 # 1 - 0.302 = 0.628

preview_area_h_high = clip_editor_y_high - screen_y - nav_h
preview_area_h_mid = clip_editor_y_mid - screen_y - nav_h

# ccc = new Layer
# 	width: 40
# 	height: preview_area_h_high
# 	y: screen_y + nav_h

preview_area = new Layer
	parent: editor_page
	width: preview_area_w
# 	height: preview_area_h
	height: preview_area_h_mid
	backgroundColor: "hsla(0,0%,93%,0)"
	x: Align.center
	y: screen_y + nav_h
	borderColor: "hsla(0,0%,50%,0.1)"
	borderWidth: 0
	borderColor: "rgba(255,0,0,0.3)"
# print "preview_area_h: " + preview_area_h
preview_area.states.add
	normal:
		x: Align.center
		height: preview_area_h_mid
# 	clip_tab:
# 		x: Align.center
# 		height: preview_area_h
	high: 
		x: Align.center
		height: preview_area_h_high
	mid: 		
		x: Align.center
		height: preview_area_h_mid

# preview_area.stateSwitch("normal")


btn_nav_back = new Layer
	parent: editor_page
	width: nav_h
	height: nav_h	
	x: 16
	y: screen_y
	backgroundColor: "hsl(0,0%,88%)"
	borderRadius: nav_h/2

icon_nav_back = new Layer
	parent: btn_nav_back
	size: 24
	point: Align.center
	image: "images/icon_back.png"

btn_nav_save = new Layer
	parent: editor_page
	width: nav_h
	height: nav_h	
	x: Align.right -16
	y: screen_y
	backgroundColor: "7876BE"
	borderRadius: nav_h/2

icon_nav_save = new Layer
	parent: btn_nav_save
	size: 24
	x: Align.center
	y: Align.center -1
	image: "images/icon_save.png"

current_canvas_ratio = 16/9
current_canvas_ratio = 3/4
current_canvas_ratio = 4/3
# current_canvas_ratio = 1/1

preview_player_margin = 12
preview_player_w = preview_area_w
# preview_player_h = 56
preview_player_h = 72
preview_player_offset = -12

preview_player = new Layer
	parent: preview_area
	width: preview_player_w
	height: preview_player_h
	y: Align.bottom
	backgroundColor: ""
	backgroundColor: "hsla(0,0%,15%,0)"


preview_play_area_size = 32
preview_play_area = new Layer
	parent: preview_player
# 	size: preview_play_area_size
	width: preview_play_area_size
	height: preview_player.height
	x: preview_player_margin
	y: Align.center 
	backgroundColor: ""

preview_play = new Layer
	parent: preview_play_area
	size: 24
	point: Align.center
# 	html: "▶️"
# 	html: "⏸"
# 	style: 
# 		fontSize: "24px"
# 		paddingTop: "22px"
	backgroundColor: ""
	image: "images/icon_play.png"
	brightness: 80

preview_timeline_w = preview_player_w - preview_player_margin*6 - preview_play_area_size
preview_timeline = new Layer
	parent: preview_player
	width: preview_timeline_w
	height: 8
# 	height: 40
	x: preview_play_area.maxX + preview_player_margin
# 	y: Align.center +preview_player_offset
	y: Align.center
	backgroundColor: "hsla(0,0%,93%,0)"

preview_timeline.states.add
	withThumb:
		height: 40
		y: 16

# preview_timeline.states.switch("withThumb")
# Utils.delay 1, ->
# # 	preview_timeline.states.switch("default")
# 	preview_timeline.states.switch("withThumb")

preview_time_total = new TextLayer
	parent: preview_player
	text: sec2time(get_highlight_total())
	x: Align.right -preview_player_margin*2
	y: 2
# 	x: preview_timeline.maxX + 0
# 	y: Align.center
	fontSize: 12
	color: "hsl(0,0%,60%)"
	backgroundColor: "hsla(0,0%,10%,0)"
	padding: 
		horizontal: 10
		vertical: 4
preview_time_total.borderRadius = preview_time_total.height/2
# preview_time_total.maxY = preview_timeline.maxY - 4
preview_time_total.states.add
	withThumb:
		y: -10
		x: Align.right -preview_player_margin*2

preview_time_total.sendToBack()

preview_margin = 8
preview_w = preview_area_w - preview_margin*2
preview_h = preview_w * current_canvas_ratio - preview_player_h

preview = new Layer
	parent: preview_area
	width: preview_w
	height: preview_h
	point: Align.center
	backgroundColor: "gray"
	borderWidth: 0

preview.states.add
	normal:
		x: Align.center
		width: preview_w
		height: preview_h
		point: Align.center
	clip_tab:
		x: Align.center
		width: preview_w
		height: preview_h
		point: Align.center

# preview.stateSwitch("normal")

preview_color_mark = new Layer
	parent: preview
	width: preview.width
	height: 8
	y: preview.height
	backgroundColor: ""
	visible: false


show_preview = ( current_canvas_ratio, preview_area_h = preview_area_h_mid ) ->
	if current_canvas_ratio > 1
		preview_h = preview_area_h - preview_margin*3 - preview_player_h
		preview_w = preview_h * 1/current_canvas_ratio
		
		
	else
		preview_w = preview_area_w - preview_margin*3
		preview_h = preview_w * current_canvas_ratio
	
	preview.width = preview_w
	preview.height = preview_h
	preview.x = Align.center
	preview.y = preview_margin
	
# 	preview.animate
# 		width: preview_w
# 		height: preview_h
# 		x: Align.center
# 		y: preview_margin
# 		options:
# 			time: 0.2
# 			curve: "ease"

show_preview(current_canvas_ratio,preview_area_h = preview_area_h_mid)



create_pages(p = preview)
update_page_slot()




preview_area.on "change:height", ->
# 	print @.height
	preview_player.y = Align.bottom
	
	if current_canvas_ratio > 1
		preview_h = @.height - preview_margin*3 - preview_player_h
		preview_w = preview_h * 1/current_canvas_ratio

	preview.width = preview_w
	preview.height = preview_h
	preview.x = Align.center
	preview.y = preview_margin
	
	preview_color_mark.width = preview_w
	preview_color_mark.y = preview.height
	
	update_pages()

# ===========================

# Clip Editor

# clip_editor_y_high = Screen.height * 0.516 # 419
# clip_editor_y_mid = Screen.height * 0.628 # 1 - 0.302 = 0.628

clip_editor_w = editor_page_w
clip_editor_h = screen_height - preview_area_h + safe_area_bottom
# clip_editor_h = 
clip_editor = new ScrollComponent
	parent: editor_page
	scrollHorizontal: false
	directionLock: true
	width: clip_editor_w
	height: clip_editor_h
# 	y: preview_area.maxY
	y: Screen.height
	y: clip_editor_y_mid
	backgroundColor: "hsl(0,0%,98%)"
	borderRadius: 20
	shadow1: 
		blur: 16
		color: "hsla(0,0%,0%,0.1)"
	contentInset: 
		bottom: 56
	mouseWheelEnabled: true


clip_editor.states.add
	high: 
		y: clip_editor_y_high
	mid: 
		y: clip_editor_y_mid

# clip_editor.stateSwitch("mid")
# print clip_editor_y_mid

clip_trim_cell_thumb_wh = 44
clip_trim_cell_thumb_w = 24
clip_trim_cell_thumb_h = 36
clip_trim_cell_thumb_r = 4
clip_trim_cell_margin = 16


clip_trim_cell_w = clip_editor_w
clip_trim_cell_h = clip_trim_cell_thumb_h + clip_trim_cell_margin*2


clip_edit_w = 32
clip_edit_h = clip_trim_cell_thumb_h

clip_trimmer_h = clip_trim_cell_thumb_h
# clip_trimmer_w = clip_trim_cell_w - clip_trim_cell_margin*4 - clip_trim_cell_thumb_w
clip_trimmer_w = clip_trim_cell_w - clip_trim_cell_margin*4 - clip_edit_w - clip_trim_cell_thumb_w



clip_trim_cell_array = []
highlight_range_array = []
highlight_range_mark_array = []
clip_time_min_array = []
clip_time_max_array = []
clip_trim_cell_thumb_array = []
timeline_array = []
time_label_all = []
thumb_play_array = []
timeline_label_array = []


duration_area_h = 56
duration_area = new Layer
	parent: clip_editor.content
	width: clip_trim_cell_w
	height: duration_area_h
# 	backgroundColor: "hsl(0,0%,35%)"
	backgroundColor: ""

duration_area_divider = new Layer
	parent: duration_area
	width: clip_trim_cell_w - 0
	height: 1
	x: Align.center
	y: Align.bottom
	backgroundColor: "hsl(0,0%,93%)"
	
clip_trim_cell_grp = new Layer
	parent: clip_editor.content
	width: clip_trim_cell_w
	height: clip_trim_cell_h * (clips.length+1)
	y: duration_area_h
	backgroundColor: "hsl(0,0%,98%)"

duration_area_divider_bottom = new Layer
	parent: clip_editor.content
	width: clip_trim_cell_w - 0
	height: 1
	x: Align.center
	y: clip_trim_cell_grp.maxY - clip_trim_cell_h + 1
	backgroundColor: "hsl(0,0%,93%)"

add_new_clip_cell = new Layer
	parent: clip_trim_cell_grp
	width: clip_trim_cell_w
	height: clip_trim_cell_h
	y: Align.bottom
	backgroundColor: ""

add_new_clip_text = new TextLayer
	parent: add_new_clip_cell
	text: "✚ Add New Clip"
# 	x: clip_trim_cell_thumb_w + clip_trim_cell_margin*2
	x: Align.center
	y: Align.center
	fontSize: 16
	color: "hsl(0,0%,60%)"
	backgroundColor: "hsla(0,0%,93%,1)"
	borderRadius: 4
	padding: 
		horizontal: 12
		vertical: 6

press_effect_dark(add_new_clip_text)






isTrimming = false

knob_array = []
highlight_range_mark_bg_array = []

for i in [0...clips.length]
	clip_trim_cell = new Layer
		parent: clip_trim_cell_grp
		width: clip_trim_cell_w
		height: clip_trim_cell_h
		y: (clip_trim_cell_h + 0) * i
		backgroundColor: "hsl(0,0%,98%)"
		index: i
	clip_trim_cell_array.push(clip_trim_cell)
	
	
	thumb_color_l = 80 - i*20
	clip_trim_cell_thumb = new Layer
		parent: clip_trim_cell
		width: clip_trim_cell_thumb_w
		height: clip_trim_cell_thumb_h
# 		width: 6
		borderRadius: clip_trim_cell_thumb_r
		x: clip_trim_cell_margin
		y: Align.center
# 		backgroundColor: "hsl(240,30%,#{thumb_color_l}%)"
		backgroundColor: ""
# 		backgroundColor: clips[i].color
# 		image: clips[i].image
		index: i
# 		visible: false
	clip_trim_cell_thumb_array.push(clip_trim_cell_thumb)
# 	press_effect_dark_2(clip_trim_cell_thumb)
	
	clip_trim_cell_thumb.onTap ->
		clip_thumb_action(@)
# 		preview_play_on(clip_i = @.index)
# 		update_current_clip(@.index)
# 		current_clip_index = @.index
# 		get_current_index()
	
	thumb_icon = new Layer
		parent: clip_trim_cell_thumb
		size: 24
		point: Align.center
		image: "images/icon_play.png"
		backgroundColor: ""
		opacity: 0.4
		opacity: 1
	
# 	thumb_icon_vect = icon_play.copy()
# 	thumb_icon_vect.parent = thumb_icon
# 	thumb_icon_vect.point = Align.center
# 	thumb_icon_vect.children[0].color = clips[i].color
	
	thumb_play = new Layer
		parent: clip_trim_cell
		size: 24
		midX: clip_trim_cell_thumb.midX
		midY: clip_trim_cell_thumb.midY
		backgroundColor: ""
		image: "images/icon_play.png"
		visible: false
		index: i
		brightness: 80
	thumb_play_array.push(thumb_play)
	
	thumb_play.onTap ->
		if isPlay is true
			preview_play_off()
		else
			clip_thumb_action(@)

# 	thumb_play_vect = icon_play.copy()
# 	thumb_play_vect.parent = thumb_play
# 	thumb_play_vect.point = Align.center
# 	thumb_play_vect.children[0].color = clips[i].color

# 	cell_page_mark = new Layer
# 		parent: clip_trim_cell
# 		width: 8
# 		height: clip_trim_cell_h
# # 		backgroundColor: "hsl(240,30%,#{thumb_color_l}%)"
# 		backgroundColor: clips[i].color
# 		index: i
# # 		originX: 0



	clip_trimmer = new Layer
		parent: clip_trim_cell
		width: clip_trimmer_w
		height: clip_trimmer_h
		x: clip_trim_cell_thumb.maxX + clip_trim_cell_margin*1
		y: Align.center
		backgroundColor: ""
	
	repeat_num = Math.ceil(clip_trimmer_w/clip_trim_cell_thumb_wh)
	
	clip_edit = new Layer
		parent: clip_trim_cell
		width: clip_edit_w
		height: clip_edit_h
		y: Align.center
		x: Align.right -clip_trim_cell_margin
		backgroundColor: ""
		borderRadius: 4
	
	
	press_effect_dark_2(clip_edit)
	
	icon_more = new Layer
		parent: clip_edit
		size: 24
		point: Align.center
		image: "images/icon_more.png"
		opacity: 0.5
	
	
	
	clip_time_total = new TextLayer
		parent: clip_trim_cell
		text: clips[i].duration
		x: Align.right -clip_trim_cell_margin
		fontSize: 10
		color: "hsl(0,0%,80%)"
	clip_time_total.maxY = clip_trimmer.y - 1
	time_label_all.push(clip_time_total)



	img_url = "#{clips[i].image}"
	highlight_range = new RangeSliderComponent
		parent: clip_trimmer
		width: clip_trimmer.width
		height: clip_trimmer.height - 2
		x: Align.center
		y: Align.center
		min: 0
		max: clips[i].duration
		minValue: clips[i].highlight[0]
		maxValue: clips[i].highlight[1]
		borderRadius: 4
		backgroundColor: "hsl(0,0%,45%)"
		index: i

	
	highlight_range.fill.backgroundColor = "hsla(240,30%,#{thumb_color_l}%,0.9)"
	highlight_range.fill.clip = true
	highlight_range.fill.borderRadius = false
	highlight_range.fill.onTouchStart ->
		
	
	
	highlight_range_mark_h = 2
	highlight_range_mark_r = 8
	
	highlight_range_mark_bg = new Layer
		parent: highlight_range
		width: highlight_range.fill.width
		height: highlight_range_mark_h
		x: highlight_range.fill.x
		y: highlight_range.fill.height - highlight_range_mark_r
		borderRadius: highlight_range_mark_r
# 		backgroundColor: clips[i].color
# 		backgroundColor: "hsl(0,0%,70%)"
		gradient: highlight_gradient
# 		brightness: 80
		saturate: 30
		index: i	
		visible: false
	highlight_range_mark_bg_array.push(highlight_range_mark_bg)
	
	
	highlight_range_mark = new Layer
		parent: highlight_range
		width: highlight_range.fill.width
		height: highlight_range_mark_h
		x: highlight_range.fill.x
		y: highlight_range.fill.height + highlight_range_mark_r - 4
# 		y: 8
		borderRadius: highlight_range_mark_r
# 		backgroundColor: "hsl(240,30%,#{thumb_color_l}%)"
# 		backgroundColor: clips[i].color
		backgroundColor: ""
		gradient: highlight_gradient
# 		backgroundColor: "hsl(0,0%,70%)"
# 		backgroundColor: cta_color
# 		borderColor: "hsl(0,0%,0%)"
# 		borderWidth: 2
		index: i
		originX: 0
# 		visible: false

	highlight_range_mark_array.push(highlight_range_mark)
	highlight_range_mark.sendToBack()
	highlight_range_mark_bg.sendToBack()
	
	highlight_range.minKnob.draggable.directionLock = true
	highlight_range.maxKnob.draggable.directionLock = true
	highlight_range.minKnob.draggable.momentum = false
	highlight_range.maxKnob.draggable.momentum = false
# 	highlight_range.minKnob.width = 12
# 	highlight_range.maxKnob.width = 12
	highlight_range.minKnob.height = clip_trimmer.height
	highlight_range.maxKnob.height = clip_trimmer.height
# 	highlight_range.minKnob.y = Align.center -2
	highlight_range.minKnob.backgroundColor = "rgba(255,0,0,0.0)"
	highlight_range.maxKnob.backgroundColor = "rgba(0,0,255,0.0)"
	highlight_range.minKnob.shadow1 = ""
	highlight_range.maxKnob.shadow1 = ""
# 	highlight_range.minKnob.clip = false
# 	highlight_range.maxKnob.clip = false
	
# 	highlight_range.maxKnob.backgroundColor = "rgba(255,0,0,0.3)"
	
	highlight_range_array.push(highlight_range)
	
	highlight_range_bg = new Layer
		parent: highlight_range
		size: highlight_range.size
		borderRadius: highlight_range.borderRadius
		brightness: 40
		index: i
		style: 
			backgroundImage: "url(" + img_url + ")"
			backgroundRepeat: "repeat-x"
			backgroundSize:  clip_trimmer_h*3 + "px"
	
	highlight_range_bg.sendToBack()

	
	min_offset = highlight_range.minValue / highlight_range.max * highlight_range.width
	highlight_range_bg_fill = new Layer
		parent: highlight_range.fill
		width: highlight_range.width
		height: highlight_range.height 
		borderRadius: highlight_range.borderRadius
		x: -min_offset
		index: i
		style: 
			backgroundImage: "url(" + img_url + ")"
			backgroundRepeat: "repeat-x"
			backgroundSize:  clip_trimmer_h*3 + "px"

	highlight_range_bg_fill.onTap ->
		clip_thumb_action(@)
	
# 	handler_w = highlight_range.minKnob.width/2 
	handler_w = 16 / 2 
	handler_w = 10
	handler_min_h = highlight_range.minKnob.height + highlight_range_mark_h-highlight_range_mark_r-12
	handler_min_h = clip_trimmer.height - 2
	handler_min = new Layer
		parent: highlight_range.minKnob
		width: handler_w
		height: handler_min_h
		y: Align.center
# 		x: Align.right
		x: Align.center
		backgroundColor: "CCCCCC"
# 		gradient: highlight_gradient
		borderRadius: handler_w/2 - 0
		borderRadius: 2
		shadow1: 
			blur: 4
			color: "rgba(0,0,0,0.1)"

	clip_time_min = new TextLayer
		parent: handler_min
		text: highlight_range.minValue
		x: Align.center
		fontSize: 10
		color: "hsl(0,0%,80%)"
		index: i
	clip_time_min.maxY = handler_min.y - 1
	clip_time_min_array.push(clip_time_min)
	time_label_all.push(clip_time_min)
	
	
	handler_max = new Layer
		parent: highlight_range.maxKnob
		width: handler_w
		height: handler_min.height
		y: Align.center
# 		x: Align.left
		x: Align.center
		backgroundColor: "CCCCCC"
# 		gradient: highlight_gradient
		borderRadius: handler_min.borderRadius
	handler_max.shadow1 = handler_min.shadow1
	
	handler_max_fix = new Layer
# 		parent: highlight_range.maxKnob
		name: "fix"
		parent: highlight_range
		height: highlight_range.minKnob.height
		width: highlight_range.width
		x: Align.left
		backgroundColor: "rgba(255,0,0,0.0)"
	
# 	handler_max_fix.sendToBack()	
	handler_max_fix.placeBehind(highlight_range.fill)
# 	c = 0
	handler_max_fix.onDragStart ->
# 		c = 0
	handler_max_fix.onDragMove ->
# 		c += 1
# 		print c
	
	clip_time_max = new TextLayer
		parent: handler_max
		text: highlight_range.maxValue
		x: Align.center
		fontSize: 10
		color: "hsl(0,0%,80%)"
		index: i
	clip_time_max.maxY = clip_time_min.maxY
	clip_time_max_array.push(clip_time_max)
	time_label_all.push(clip_time_max)

	knob_array.push(highlight_range.minKnob)
	knob_array.push(highlight_range.maxKnob)

# 	highlight_range.minKnob.onTouchEnd ->
# 		mark.saturate = 100 for mark in highlight_range_mark_array
# 		timeline.saturate = 100 for timeline in timeline_array
# 		timeline.saturate = 100 for timeline in timeline_array
# 		time_indicator.opacity = 100
# 
# 	highlight_range.maxKnob.onTouchEnd ->
# 		mark.saturate = 100 for mark in highlight_range_mark_array
# 		timeline.saturate = 100 for timeline in timeline_array
# 		time_indicator.opacity = 100
	
# 	knob_array = [highlight_range.minKnob,highlight_range.maxKnob] 
# 	for knob in knob_array
# 		knob.onTouchEnd ->
# 			mark.saturate = 100 for mark in highlight_range_mark_array
# 			for timeline in timeline_array
# 				timeline.saturate = 100 
# 				timeline.animate { scaleY: 1, options: {curve:"ease-out", time: 0.2}} 
# 			time_indicator.opacity = 100
		
	
	highlight_range.onValueChange ->
		i = @.index
		min_offset = @.minValue / @.max * @.width
		@.fill.children[0].x = -min_offset
		clips[i].highlight[0] = @.minValue
		clips[i].highlight[1] = @.maxValue
		clip_time_min_array[i].text = @.minValue.toFixed(0)
		clip_time_max_array[i].text = @.maxValue.toFixed(0)

		highlight_range_mark_array[i].width = @.fill.width
		highlight_range_mark_array[i].x = @.fill.x

		
		highlight_range_mark_bg_array[i].width = @.fill.width
		highlight_range_mark_bg_array[i].x = @.fill.x		
		
		preview_play_off() if isPlay is true
# 		time_indicator.midX = preview_timeline.width if time_indicator.midX > preview_timeline.width
# 		current_time = time_indicator.midX / preview_timeline.width * get_highlight_total()
		update_highlight()


		if preview_time_total.isAnimating is false
			preview_time_total.animate
				backgroundColor: "hsla(0,0%,10%,1)"
				color: "hsl(0,0%,100%)"
				options: 
					time: 0.1
		
		
		timeline_label_array[@.index].x = Align.center
		d = timeline_label_array[@.index].parent.width / preview_timeline.width * get_highlight_total()
		timeline_label_array[@.index].text = d.toFixed(1) + "s"

# 		time_indicator.midX = preview_timeline.width if time_indicator.midX > preview_timeline.width
# 		current_time = time_indicator.midX / preview_timeline.width * get_highlight_total()
# 		print current_time
# 		time_indicator.midX = current_time / get_highlight_total() * preview_timeline.width
		

	
	
# 	highlight_range.minKnob.onDragStart ->
	highlight_range.minKnob.onTouchStart ->
		isTrimming = true
		
# 		update_highlight()
		for i in [0...clips.length]
			highlight_ratio = clips[i].highlight[1]-clips[i].highlight[0]
			timeline_w = highlight_ratio/get_highlight_total()
			timeline.width = timeline_w * preview_timeline_w
			timeline_array[i].width = timeline_w * preview_timeline_w
			timeline_array[i].x = timeline_array[i-1].maxX if i > 0
			timeline_array[i].children[0].width = timeline_array[i].width
			preview_time_total.text = sec2time(get_highlight_total())
			preview_time_total.x = Align.right -preview_player_margin*2

		time_indicator.midX = timeline_array[@.parent.index].x + 1
		get_current_index()
		current_clip_index = @.parent.index
		update_current_clip(current_clip_index)
# 		current_clip_index = @.parent.index
# 		set_current_index(@.parent.index)
# 		update_current_clip(@.parent.index)
		update_current_trim_handler_color(@.parent.index)	
		clip_indicator_array[0].x = @.midX + handler_w/2


	
# 	highlight_range.maxKnob.onDragStart ->
	highlight_range.maxKnob.onTouchStart ->
		isTrimming = true	

		for i in [0...clips.length]
			highlight_ratio = clips[i].highlight[1]-clips[i].highlight[0]
			timeline_w = highlight_ratio/get_highlight_total()
			timeline.width = timeline_w * preview_timeline_w
			timeline_array[i].width = timeline_w * preview_timeline_w
			timeline_array[i].x = timeline_array[i-1].maxX if i > 0
			timeline_array[i].children[0].width = timeline_array[i].width
			preview_time_total.text = sec2time(get_highlight_total())
			preview_time_total.x = Align.right -preview_player_margin*2

		time_indicator.midX = timeline_array[@.parent.index].maxX - 1
		get_current_index()
		current_clip_index = @.parent.index
		update_current_clip(current_clip_index)
# 		current_clip_index = @.parent.index
# 		set_current_index(@.parent.index)
# 		update_current_clip(@.parent.index)
		update_current_trim_handler_color(@.parent.index)				
		clip_indicator_array[0].midX = @.midX - handler_w/2
# 		print clip_indicator_array[0].midX


	highlight_range.minKnob.onDragMove ->
		time_indicator.midX = timeline_array[@.parent.index].x + 1
		time_indicator.opacity = 0
		c.opacity = 0 for c in clip_indicator_array

	highlight_range.maxKnob.onDragMove ->
		time_indicator.opacity = 0
		time_indicator.midX = timeline_array[@.parent.index].maxX - 1
		c.opacity = 0 for c in clip_indicator_array
		

	
	highlight_range.minKnob.onDragEnd ->
		isTrimming = false
		timeline_label_array[@.parent.index].opacity = 0
# 		timeline_array[@.parent.index].brightness = 100
		preview_time_total.animate
			backgroundColor: "hsla(0,0%,10%,0)"
			color: "hsl(0,0%,60%)"
			options: 
				time: 0.3
		
		time_indicator.opacity = 1
		time_indicator.midX = timeline_array[@.parent.index].x + 1
		c.opacity = 1 for c in clip_indicator_array
		
		
	highlight_range.maxKnob.onDragEnd ->
		isTrimming = false
		timeline_label_array[@.parent.index].opacity = 0
# 		timeline_array[@.parent.index].brightness = 100
		preview_time_total.animate
			backgroundColor: "hsla(0,0%,10%,0)"
			color: "hsl(0,0%,60%)"
			options: 
				time: 0.3
		
		time_indicator.opacity = 1
		time_indicator.midX = timeline_array[@.parent.index].maxX - 1
		c.opacity = 1 for c in clip_indicator_array






	highlight_ratio = clips[i].highlight[1]-clips[i].highlight[0]
	timeline_w = highlight_ratio/get_highlight_total()

	timeline = new Layer
		parent: preview_timeline
		height: preview_timeline.height
		width: timeline_w * preview_timeline_w
# 		backgroundColor: "hsl(240,30%,#{thumb_color_l}%)"
# 		backgroundColor: clips[i].color
		backgroundColor: "CCCCCC"
# 		gradient: highlight_gradient
		gradient: ""
		index: i
	timeline_array.push(timeline)
	timeline_array[i].x = timeline_array[i-1].maxX if i > 0
	timeline.states.add
		withThumb:
			height: preview_timeline.states.withThumb.height
			y: 0
		noThumb:
			height: preview_timeline.height
			y: 0

	timeline_thumb = new Layer
		parent: timeline
		width: timeline.width
		height: timeline.height - 8
		style: 
			backgroundImage: "url(" + img_url + ")"
			backgroundRepeat: "repeat-x"
			backgroundSize:  clip_trimmer_h*3 + "px"
	
	timeline_thumb.states.add
		withThumb:
			height: preview_timeline.states.withThumb.height - 8
			y: 0

	
	timeline_label = new TextLayer
		parent: timeline
		text: sec2time(0)
		text: 0 + "s"
		x: Align.center
		y: Align.center -0
		fontSize: 11
		color: "hsl(0,0%,95%)"
		backgroundColor: "hsla(0,0%,93%,0)"
		padding: 
			horizontal: 2
		shadowY: 0.5
		shadowBlur: 1
		shadowColor: "rgba(0,0,0,0.2)"
		opacity: 0
	timeline_label_array.push(timeline_label)
	d = timeline_label.parent.width / preview_timeline.width * get_highlight_total()
	timeline_label.text = d.toFixed(1) + "s"

	timeline_end_line = new Layer
		parent: timeline
		width: 2
		height: preview_timeline.height
# 		backgroundColor: clips[i].color
		backgroundColor: editor_page.backgroundColor
# 		gradient: highlight_gradient
# 		brightness: 90

preview_ori_index = current_clip_index
isKnobDragging = false
timeline_scale_y = 2

isScrolling = false






prev_index = 0

for knob in knob_array
	knob.draggable.directionLock = true
	knob.onTouchStart ->
		isKnobDragging = true
		timeline_array[@.parent.index].animate { scaleY: timeline_scale_y, options: {curve:"ease-out", time: 0.2}} 
		time_indicator.opacity = 0
# 		timeline.saturate = 0 for timeline in timeline_array
# 		timeline_array[@.parent.index].saturate = 100

		mark.saturate = 0 for mark in highlight_range_mark_array
		highlight_range_mark_array[@.parent.index].saturate = 100
		highlight_range_mark_array[@.parent.index].backgroundColor = clips[@.parent.index].color

		preview_color_mark.backgroundColor = clips[@.parent.index].color
		timeline_label_array[@.parent.index].opacity = 1
		timeline_label_array[@.parent.index].scaleY = 1/timeline_scale_y
		p.opacity = 0 for p in page_array
		page_array[clips[@.parent.index].page].opacity = 1
		if isShowSlotBorder
			s.borderWidth = 0 for s in slot_array
			slot_array[@.parent.index].borderWidth = 6

# 		if preview_color_mark.backgroundColor.toHexString() is "#f9cc73"
# 			timeline_label_array[@.parent.index].color = "hsl(0,0%,50%)"

		c.backgroundColor = "hsl(0,0%,98%)" for c in clip_trim_cell_array
		clip_trim_cell_array[current_clip_index].backgroundColor = "hsl(0,0%,85%)"

		if clip_indicator_array.length > 0
			clip_indicator_array[0].visible = false
		
# 		prev_index = current_clip_index
		update_current_trim_handler_color(@.parent.index)
		
		
		
	knob.onTouchMove ->
		time_indicator.opacity = 0
# 		timeline_label_array[@.parent.index].x = Align.center
# 		preview.borderColor = clips[@.parent.index].color
# 		preview.image = clips[@.parent.index].image

	knob.onTouchEnd ->
		isKnobDragging = false
# 		mark.saturate = 100 for mark in highlight_range_mark_array

		highlight_range_mark_array[@.parent.index].backgroundColor = clips[@.parent.index].color
		
		for timeline in timeline_array
			timeline.animateStop()
# 			timeline.saturate = 100 
			timeline.animate { scaleY: 1, options: {curve:"ease-out", time: 0.2}} 
			Utils.delay 0.3, ->
				timeline.scaleY = 1
				
		
		time_indicator.opacity = 1
		time_indicator.midX = timeline_array[@.parent.index].x + 1
		get_current_index()
		current_clip_index = @.parent.index
		update_current_clip(current_clip_index)
		
		preview_color_mark.backgroundColor = clips[current_clip_index].color
		preview.image = clips[current_clip_index].image
		timeline_label_array[@.parent.index].opacity = 0
		
		
		c.backgroundColor = "hsl(0,0%,98%)" for c in clip_trim_cell_array
		clip_trim_cell_array[current_clip_index].backgroundColor = "hsl(0,0%,85%)"

		p.opacity = 0 for p in page_array
		page_array[clips[current_clip_index].page].opacity = 1
		if isShowSlotBorder
			s.borderWidth = 0 for s in slot_array
			slot_array[current_clip_index].borderWidth = 6

		if clip_indicator_array.length > 0
			clip_indicator_array[0].visible = true
			
# 		update_current_trim_handler_color(prev_index)




current_time = 0
last_play_time = 0
current_clip_index = 0
current_clip_index_dummy = new Layer
	size: 10
	x: 0

countdown_time = 0.1
total_time = get_highlight_total() * 1/countdown_time



myInterval = null
count = 0
isPlay = false


time_indicator_w = 36
time_indicator = new Layer
	parent: preview_timeline
	width: time_indicator_w
	height: time_indicator_w
	y: Align.center
	x: -time_indicator_w/2
# 	backgroundColor: "white"
	backgroundColor: "hsla(0,0%,0%,0)"
# 	borderRadius: 1
	clip: false

time_indicator.states.add
	withThumb:
# 		x: -time_indicator_w/2
		height: 48
		y: Align.center +4
	ori:
		height: time_indicator_w
		y: Align.center -10

time_indicator.draggable.enabled = true
time_indicator.draggable.vertical = false
time_indicator.draggable.overdrag = false
time_indicator.draggable.momentum = false
time_indicator.draggable.constraints =
	x: -time_indicator_w/2
	width: preview_timeline.width + time_indicator_w
time_indicator.draggable.bounce = false

time_indicator_mark = new Layer
	parent: time_indicator
	width: 2
	height: 24
	x: Align.center
	y: Align.center
	backgroundColor: "hsl(0,0%,100%)"
	borderRadius: 1
	shadow1: 
		y: 2
		blur: 3
		color: "hsla(0,0%,0%,0.2)"
time_indicator_mark.states.add
	withThumb:
		height: 48
		y: Align.center

time_indicator_label = new TextLayer
	parent: time_indicator
	text: sec2time(0)
	x: Align.center
	y: -16
	fontSize: 12
	color: "hsl(0,0%,60%)"
	backgroundColor: "hsla(0,0%,93%,1)"
	padding: 
		horizontal: 12
		vertical: 4
# 	borderWidth: 1
time_indicator_label.borderRadius = time_indicator_label.height/2





# isTrimming_label = new TextLayer
# 	parent: preview
# 	text: isTrimming
# 	point: Align.center
# 	fontSize: 30
# 	color: "hsl(0,0%,0%)"

clip_indicator_array = []
prev_i = -1

time_indicator.on "change:x", ->
	time_indicator.midX = preview_timeline.width if time_indicator.midX > preview_timeline.width
	
	current_time = time_indicator.midX / preview_timeline.width * get_highlight_total()
	time_ratio = time_indicator.midX / preview_timeline.width
	count = get_highlight_total() * time_ratio * 1/countdown_time
	time_indicator_label.text = sec2time(current_time)
	get_current_index()
	update_current_clip(current_clip_index)
	
	i = current_clip_index
	clip_total_time_w = timeline_array[i].width / preview_timeline.width
	clip_current_x = (time_indicator.midX - timeline_array[i].x).toFixed(2)
	clip_scale = clip_current_x / (timeline_array[i].width).toFixed(2)
# 	print clip_current_x + " / " + (timeline_array[i].width).toFixed(2)
# 	print clip_scale.toFixed(4)
# 	s.scale = 1 for s in slot_obj_array
	slot_obj_array[current_clip_index].scale = 1 + (clip_scale.toFixed(4)*0.5)
# 	highlight_range_mark_array
	
# 	h.scaleX = 1 for h in highlight_range_mark_array
# 	highlight_range_mark_array[i].scaleX = clip_scale
	
	
	
	if prev_i isnt i
		c.destroy() for c in clip_indicator_array
		clip_indicator_array = []
# 		print highlight_range_mark_array[i].parent
		clip_indicator = new Layer
			parent: highlight_range_array[i]
# 			parent: highlight_range_mark_array[i].parent
			width: 2
			height: clip_trim_cell_h - 16 - 8
			y: Align.center +0
			backgroundColor: "white"
			borderRadius: 1
			shadow1: { blur: 4, color: "hsla(0,0%,0%,0.3)" }
		clip_indicator.placeBehind(highlight_range_array[i].children[2])
		clip_indicator_array.push(clip_indicator)
	else
		c_dist_ratio = (time_indicator.midX - timeline_array[i].x) / timeline_array[i].width
		c_dist = c_dist_ratio * highlight_range_mark_array[i].width
# 		clip_indicator_array[0].x = (time_indicator.midX - timeline_array[i].x) + highlight_range_mark_array[i].x
		clip_indicator_array[0].x = c_dist + highlight_range_mark_array[i].x
	
	prev_i = i
	
# 	t = clip_total_time_w * get_highlight_total()
# 	highlight_range_mark_array[i].
# 	highlight_range_mark_array[i].animate
# 		scaleX: 1
# 		options: { curve: "linear", time: t }
		

time_indicator.onDragStart ->
	preview_play_off()





update_highlight = ->
	for i in [0...clips.length]
		highlight_ratio = clips[i].highlight[1]-clips[i].highlight[0]
		timeline_w = highlight_ratio/get_highlight_total()
		timeline.width = timeline_w * preview_timeline_w
		timeline_array[i].width = timeline_w * preview_timeline_w
		timeline_array[i].x = timeline_array[i-1].maxX if i > 0
		timeline_array[i].children[0].width = timeline_array[i].width
		preview_time_total.text = sec2time(get_highlight_total())
		preview_time_total.x = Align.right -preview_player_margin*2
		
	
	time_indicator.midX = preview_timeline.width if time_indicator.midX > preview_timeline.width
	time_indicator.midX = current_time / get_highlight_total() * preview_timeline.width
	
	


	
	

show_timeline_thumb = ->
	preview_timeline.states.switch("withThumb")
	time_indicator.states.switch("withThumb")
	time_indicator_mark.states.switch("withThumb")
	preview_time_total.states.switch("withThumb")
	for t in timeline_array
		t.children[0].states.switch("withThumb")
		t.states.switch("withThumb")

hide_timeline_thumb = ->
	preview_timeline.states.switch("default")
	time_indicator.states.switch("ori")
	time_indicator_mark.states.switch("default")
	preview_time_total.states.switch("default")
	for t in timeline_array
		t.children[0].states.switch("default")
		t.states.switch("noThumb")
	

show_timeline_thumb()




preview_play_off = ->
	preview_play.image = "images/icon_play.png"
	isPlay = false
	clearInterval(myInterval)
	time_indicator.animateStop()
	thumb.visible = false for thumb in thumb_play_array
	thumb.visible = true for thumb in clip_trim_cell_thumb_array

preview_play_on = (clip_i = null) ->
	preview_play.image = "images/icon_pause.png"
	isPlay = true
	if thumb_play_array.length > 0
		thumb_play_array[0].opacity = 1
	else
		add_thumb_play(current_clip_index)
	
	get_current_index()
	update_current_clip()
	clearInterval(myInterval)
	total_time = get_highlight_total() * 1/countdown_time
	
	if clip_i is null
		if count >= total_time
			count = 0
			time_indicator.x = -time_indicator_w/2
		time_ratio = 1 - count/total_time
	else
		time_ratio = 1 - timeline_array[clip_i].x/preview_timeline.width
		count = get_highlight_total() * (1-time_ratio) * 1/countdown_time
		time_indicator.x = timeline_array[clip_i].x-time_indicator_w/2

	time_indicator.animate
		x: preview_timeline.width
		options: 
			curve: "linear"
			time: get_highlight_total() * time_ratio
	
	
	myInterval = Utils.interval countdown_time, ->
		count = count + 1
		current_time = count/total_time * get_highlight_total()
		total_time_sec = sec2time(current_time)
		time_indicator_label.text = total_time_sec
		time_indicator_label.x = Align.center
		if count >= total_time
			clearInterval(myInterval)
			isPlay = false
# 			count = 0
			current_clip_index = 0
			preview_play_off()
		else
			for i in [0...timeline_array.length]
				get_current_index()


clip_thumb_action = (thumb) ->
	preview_play_on(clip_i = thumb.index)
	update_current_clip(thumb.index)
	current_clip_index = thumb.index
	get_current_index()



# previous_clip_index = 0
# clips_max_x = []
# 
# get_current_index_2 = ->
# 	i = current_clip_index
# 	c = i + 1
# 	current_time_bar_w = time_indicator.x + time_indicator_w/2
# 	bbb.width = current_time_bar_w
# 	for i in [0...timeline_array.length]
# 		if i < clips.length-1
# 			if current_time_bar_w > timeline_array[i].maxX and previous_clip_index isnt c
# # 				print "#{Math.floor(current_time)}: " + c
# 				previous_clip_index = c
# 				return c
# # 		else if i


set_current_index = (i=0) ->
	current_clip_index = i 
	current_clip_index_dummy.x = Math.floor(current_clip_index)


get_current_index = ->
	for i in [0...timeline_array.length]
		if i < clips.length
			if time_indicator.maxX-time_indicator_w/2 > timeline_array[i].x and time_indicator.maxX-time_indicator_w/2 < timeline_array[i].maxX
# 				if i < clips.length-1
				current_clip_index = i 
				current_clip_index_dummy.x = Math.floor(current_clip_index)
# 				else				
# 					current_clip_index_dummy.x = current_clip_index
# 				print current_clip_index
			else if time_indicator.maxX-time_indicator_w/2 < timeline_array[0].maxX
				current_clip_index = 0 if current_clip_index isnt 0
				current_clip_index_dummy.x = Math.floor(current_clip_index)

	update_current_trim_handler_color(current_clip_index)

	

update_current_trim_handler_color = ( c_index = current_clip_index ) ->
	for i in [0...timeline_array.length]
		highlight_range_array[i].minKnob.children[0].gradient = ""
		highlight_range_array[i].maxKnob.children[0].gradient = ""
		timeline_array[i].gradient = ""
		
	highlight_range_array[c_index].minKnob.children[0].gradient = highlight_gradient
	highlight_range_array[c_index].maxKnob.children[0].gradient = highlight_gradient
	timeline_array[c_index].gradient = highlight_gradient
	
	
update_current_trim_handler_color(0)



update_current_clip = (index=current_clip_index) ->
	i = index
	if isKnobDragging isnt true
# 		c.backgroundColor = "hsl(0,0%,98%)" for c in clip_trim_cell_array
# 		preview.backgroundColor = timeline_array[i].backgroundColor
# 		preview.borderColor = timeline_array[i].backgroundColor
		preview_color_mark.backgroundColor = timeline_array[i].backgroundColor
# 		print timeline_array[i].backgroundColor.toHexString()
		img_url = "#{clips[i].image}"
		preview.image = img_url
# 		backgroundImage: "url(" + img_url + ")"
# 		backgroundRepeat: "repeat-x"
# 		backgroundSize:  clip_trimmer_h*3 + "px" 
		p.opacity = 0 for p in page_array
		a = clips[i].page
		page_array[a].opacity = 1
		
		if isShowSlotBorder
			s.borderWidth = 0 for s in slot_array
			slot_array[i].borderWidth = 6
	
# 		update_current_page()

	if isPlay is true
		add_thumb_play(i)
	




scroll_state = "top"

current_clip_index_dummy.on "change:x", ->
	i = @.x
	update_current_clip(i)
	current_page_index = clips[i].page
	selected_page_frame.x = page_thumb_array[current_page_index].x - selected_page_frame_b_w

	
	if isTrimming is false
		c.backgroundColor = "hsl(0,0%,98%)" for c in clip_trim_cell_array
		clip_trim_cell_array[i].backgroundColor = "hsl(0,0%,90%)"
		if current_clip_index >= 3 and scroll_state isnt "bottom"
			scroll_state = "bottom"
			if clip_editor.isMoving is false
				clip_editor.scrollToPoint(
					y: clip_editor.content.maxY
					true
					time: 0.3
				)
			
		else if current_clip_index < 3 and scroll_state isnt "top"
			scroll_state = "top"
			if clip_editor.isMoving is false
				clip_editor.scrollToPoint(
					y: clip_editor.content.y
					true
					time: 0.3
				)
		

	
	previous_clip_index = i



update_current_clip()


add_thumb_play = (index) ->	
	thumb.visible = true for thumb in clip_trim_cell_thumb_array
	thumb.visible = false for thumb in thumb_play_array
	thumb_play_array[index].visible = true	
	clip_trim_cell_thumb_array[index].visible = false


preview_play_area.onTap ->
	preview_play_toggle()
	

preview_play_toggle = ->
	if isPlay is true
		preview_play_off()
	else
		preview_play_on(clip_i = null)

time_label_all_toggle = ->
	for label in time_label_all
		if label.opacity is 1
			label.opacity = 0
		else
			label.opacity = 1

preview.onLongPress ->
	time_label_all_toggle()

time_label_all_toggle()


# ==================================

	
	
bottom_gradient = new Layer
	parent: editor_page
	width: Screen.width, height: 104
	maxY: Screen.height
	style: "background": "-webkit-gradient(linear, left top, left bottom, color-stop(0%,hsla(0,0%,0%,0)), color-stop(100%,hsla(0,0%,0%,0.3)))"



btn_w = 80
btn_h = 40
btn_margin = 24

btn_clip_editor_bottom = new Layer
	parent: bottom_gradient
	width: bottom_gradient.width
	height: bottom_gradient.height
# 	backgroundColor: "hsla(0,0%,100%,1)"
	backgroundColor: "FAFAFA"
# 	shadow1: 
# 		blur: 16
# 		color: "hsla(0,0%,0%,0.2)"



tab_scroll = new ScrollComponent
	parent: btn_clip_editor_bottom
	width: Screen.width, height: 64
	scrollVertical: false

tab_area_w = 66
tab_area_h = 60
tab_area_array = []

for i in [0...data_tab_images.length]
	tab_area = new Layer
		parent: tab_scroll.content
		width: tab_area_w
		height: tab_area_h
		x: tab_area_w * i
		index: i
		backgroundColor: "FAFAFA"
		borderWidth: 0
	
	tab_area_array.push(tab_area)
	
# 	print "images/tab/#{data_tab_images[i].active}"
	tab_icon = new Layer
		parent: tab_area
		size: 36
		x: Align.center
		y: 4
		image: "images/tab/#{data_tab_images[i].unactive}"
		index: i

	tab_text = new TextLayer
		parent: tab_area
		text: data_tab_images[i].text
		x: Align.center
		y: Align.bottom -2
		fontSize: 12
		fontWeight: 600
		color: "hsl(0,0%,60%)"
		backgroundColor: "hsla(0,0%,95%,0)"
		index: i
# 		padding: 
# 			horizontal: 8
# 			vertical: 6
		
	tab_area.onTap ->
		update_current_tab(@.index)
		





current_tab_index = 0

update_current_tab = (i = current_tab_index) ->
	for tab in tab_area_array
		tab.children[0].image = "images/tab/#{data_tab_images[tab.index].unactive}"
		tab.children[1].color = "hsl(0,0%,60%)"
	tab_area_array[i].children[0].image = "images/tab/#{data_tab_images[i].active}"
	tab_area_array[i].children[1].color = "hsl(0,0%,30%)"
	
	
	if i is 1 # Trim
		clip_editor_on()
		preview_area.states.switch("high")
		clip_editor.states.switch("high")
		btn_clip_editor_bottom.shadow1 = {blur: 16,color: "hsla(0,0%,0%,0.2)"}
	else if i is 2
		clip_editor_off()
		preview_area.states.switch("high")
		clip_editor.states.switch("high")
		btn_clip_editor_bottom.shadow1 = {blur: 16,color: "hsla(0,0%,0%,0.2)"}
	else
		clip_editor_off()
		clip_editor.states.switch("mid")
		preview_area.states.switch("mid")	
		btn_clip_editor_bottom.shadow1 = {blur: 16,color: "hsla(0,0%,0%,0)"}
	
	if i is 0
		style_options.image = "images/options.png"
	else
		style_options.image = ""
	
	
	if i is 2
		layout_page.visible = true
	else
		layout_page.visible = false

	if i is 1 or i is 2
		if preview_timeline.states.current.name is ("withThumb")
			hide_timeline_thumb()
	else
		if preview_timeline.states.current.name isnt ("withThumb")
			show_timeline_thumb()
		
# preview_timeline.states.switch("default")









# tab_area_array[1].onTap ->
# 	clip_editor_on()



btn_clip_editor_enter = new Layer
	parent: bottom_gradient
	width: btn_w, height: btn_h
	x: Align.right -btn_margin
	y: Align.center -10
	borderRadius: btn_h/2
	backgroundColor: "white"
	shadow1: 
		blur: 16
		color: "hsla(0,0%,0%,0.2)"
	opacity: 0
	visible: false



# =====================

	

btn_toggle_clip_editor = new TextLayer
	parent: btn_clip_editor_enter
	text: "Enter"
	x: Align.center
	y: Align.center
	fontSize: 18
	color: "hsl(0,0%,30%)"
	backgroundColor: "hsla(0,0%,80%,0)"
	padding: 
		horizontal: 16
		vertical: 6
btn_toggle_clip_editor.borderRadius = btn_toggle_clip_editor.height/2


tab_page_bg = new Layer
	parent: clip_editor
	width: clip_editor.width
	height: clip_editor.width
	backgroundColor: clip_editor.backgroundColor
# 	visible: false

tab_page_bg.onTap ->

style_options = new Layer
	parent: tab_page_bg
	width: 327
	height: 162
	x: Align.center
	y: 24
	image: "images/options.png"
	backgroundColor: "F2F2F2"
	borderRadius: 12
	


clip_editor_on = ->
	tab_page_bg.visible = false
	preview_play_off()
	count = 0
	current_clip_index = 0
	current_time = 0
	total_time_sec = sec2time(current_time)
# 	time_indicator_label.text = total_time_sec
# 	print time_indicator_label.text
	preview_play.image = "images/icon_play.png"

clip_editor_off = ->
# 	print "clip_editor_off"
	tab_page_bg.visible = true
	if time_indicator.states.current.name isnt "withThumb"
		preview_play_off()
		count = 0
		current_clip_index = 0
		current_time = 0
		total_time_sec = sec2time(current_time)
# 		time_indicator_label.text = total_time_sec
	
		preview_play.image = "images/icon_play.png"
	# 	clip_editor.states.switch("off")
# 		clip_editor.states.switch("mid")
# 		show_timeline_thumb()






layout_page = new Layer
	parent: clip_editor
	width: clip_editor.width
	height: clip_editor.height
	backgroundColor: "rgba(255,0,0,0)"
# 	borderColor: "red"
# 	borderWidth: 1
	borderRadius: clip_editor.borderRadius

layout_page_bg = new Layer
	parent: layout_page
	width: clip_editor.width
	height: clip_editor.height
	backgroundColor: "rgba(255,255,255,1)"
	borderColor: "red"
	borderWidth: 0
	borderRadius: clip_editor.borderRadius

layout_page_bg.onTap ->


segmented_bar = new Layer
	parent: layout_page
	width: 295
	height: 32
	x: Align.center
	y: 20
	image: "images/segmented_bar.png"
	

layout_pages_area = new Layer
	parent: layout_page
	width: 327
	height: 200 # 181
	x: Align.center
	y: segmented_bar.maxY + 20
	backgroundColor: "F2F2F2"
	borderRadius: 12
	clip: true




page_thumb_margin = 10

layout_pages_scroll = new ScrollComponent
	parent: layout_pages_area
	scrollVertical: false
	width: layout_pages_area.width
	height: layout_pages_area.height
	contentInset:
		left: page_thumb_margin

layout_pages_scroll.content.clip = false

p_num = 4.2
page_thumb_w = (layout_pages_scroll.width + page_thumb_margin) / p_num
page_thumb_h = page_thumb_w * preview.height/preview.width
page_thumb_edit_h = 24
page_thumb_y = (layout_pages_scroll.height - page_thumb_h-page_thumb_edit_h) / 2

page_thumb_array = []

selected_page_frame_b_w = 3
selected_page_frame_w = selected_page_frame_b_w*2 + page_thumb_w
selected_page_frame_h = selected_page_frame_b_w*2 + page_thumb_h + page_thumb_edit_h
current_page_index = 0
selected_page_frame_array = []

for i in [0...page_array.length]
	page_thumb = new Layer
		parent: layout_pages_scroll.content
		width: page_thumb_w
		height: page_thumb_h
		x: (page_thumb_w+page_thumb_margin) * i
		y: page_thumb_y
		borderRadius: 2
		index: i
		clip: true
	page_thumb_array.push(page_thumb)
	
	page_thumb.onTap ->
		current_page_index = @.index
		update_current_page()
		Utils.delay 0.1, ->
			preview_play_on(current_clip_index)	if isPlay is true


selected_page_frame = new Layer
	parent: layout_pages_scroll.content
	width: selected_page_frame_w
	height: selected_page_frame_h
	borderWidth: selected_page_frame_b_w
	borderColor: "hsl(0,0%,35%)"
	borderRadius: 2
	y: page_thumb_y - selected_page_frame_b_w
	x: -selected_page_frame_b_w
	backgroundColor: ""


selected_page_edit = new Layer
	parent: selected_page_frame
	width: selected_page_frame.width
	height: page_thumb_edit_h
	y: Align.bottom +4
	backgroundColor: selected_page_frame.borderColor

selected_page_frame.onTap ->

icon_selected_page_edit = new Layer
	parent: selected_page_edit
	size: 16
	x: Align.center
	y: Align.center +1
	image: "images/icon_edit.png"

	
	
update_page_thumb = ->
	p_ratio = page_thumb_w/preview.width
	for i in [0...page_array.length]
		p_copy = page_array[i].copy()
		p_copy.parent = page_thumb_array[i]
		p_copy.originX = 0
		p_copy.originY = 0
		p_copy.scale = p_ratio
		p_copy.opacity = 1
		p_copy.borderWidth = 0
		
update_page_thumb()


update_current_page = ->
# 	selected_page_frame.x = page_thumb_array[clips[current_clip_index].page].x - selected_page_frame_b_w
# 	selected_page_frame.x = page_thumb_array[current_page_index].x - selected_page_frame_b_w
# 	preview_play_off() if isPlay is true
	
	for i in [0...clips.length]
		if clips[i].page is current_page_index
			current_clip_index = i
# 			current_clip_index_dummy.x = current_clip_index
			time_indicator.animate
				x: timeline_array[i].x - time_indicator.width/2 + time_indicator_mark.width/2
				options: 
					curve: "ease"
					time: 0.01
				
# 			update_current_clip(current_clip_index)
			return
	



# ==================================


# btn_duration_1 = new TextLayer
# 	parent: duration_area
# 	text: "-1s"
# 	x: 16
# 	y: Align.center
# 	fontSize: 12
# 	color: "hsl(0,0%,60%)"
# 	backgroundColor: "hsl(0,0%,95%)"
# 	padding: 
# 		horizontal: 8
# 		vertical: 6
# btn_duration_1.borderRadius = btn_duration_1.height/2
# 
# 
# 
# btn_duration_2 = new TextLayer
# 	parent: duration_area
# 	text: "+1s"
# 	x: Align.right -16
# 	y: Align.center
# 	fontSize: 12
# 	color: "hsl(0,0%,60%)"
# 	backgroundColor: "hsl(0,0%,95%)"
# 	padding: 
# 		horizontal: 8
# 		vertical: 6
# btn_duration_2.borderRadius = btn_duration_2.height/2




btn_duration_w = 60

btn_duration_15s = new TextLayer
	parent: duration_area
	text: "15s"
	width: btn_duration_w
# 	x: btn_duration_9s.maxX + 16
	x: Align.center
	y: Align.center
	fontSize: 14
	color: "hsl(0,0%,40%)"
	backgroundColor: "hsl(0,0%,95%)"
	padding: 
		horizontal: 16
		vertical: 6
	textAlign: Align.center

btn_duration_15s.borderRadius = btn_duration_15s.height/2


btn_duration_margin = 12
btn_duration_9s = new TextLayer
	parent: duration_area
	text: "  9s"
	width: btn_duration_w
# 	x: btn_duration_1.maxX + 16
	x: Align.center -btn_duration_15s.width-btn_duration_margin
	y: Align.center
	fontSize: 14
	color: btn_duration_15s.color
	backgroundColor: btn_duration_15s.backgroundColor
	padding: 
		horizontal: 16
		vertical: 6
btn_duration_9s.borderRadius = btn_duration_9s.height/2



btn_duration_20s = new TextLayer
	parent: duration_area
	text: "20s"
	width: btn_duration_w
# 	x: btn_duration_15s.maxX + 16
	x: Align.center +btn_duration_15s.width+btn_duration_margin
	y: Align.center
	fontSize: 14
	color: btn_duration_15s.color
	backgroundColor: btn_duration_15s.backgroundColor
	padding: 
		horizontal: 16
		vertical: 6
btn_duration_20s.borderRadius = btn_duration_20s.height/2


# btn_duration_array = [ btn_duration_1,btn_duration_2,btn_duration_9s,btn_duration_15s,btn_duration_20s ]
btn_duration_array = [ btn_duration_9s,btn_duration_15s,btn_duration_20s ]
for btn in btn_duration_array
	press_effect_dark(btn)

	btn.onTapEnd ->
		Utils.delay 1, ->
			if preview_time_total.color isnt "hsl(0,0%,60%)"
				preview_time_total.animate
					backgroundColor: "hsla(0,0%,10%,0)"
					color: "hsl(0,0%,60%)"
					options: 
						time: 0.3
# 		Utils.delay 0.5, ->
			mark.saturate = 100 for mark in highlight_range_mark_array
# 			for timeline in timeline_array
# 				timeline.saturate = 100 
# 				timeline.animate { scaleY: 1, options: {curve:"ease-out", time: 0.3}} 
# 				timeline.scaleY = 1
			time_indicator.opacity = 100


# btn_duration_diff = 0.5 / clips.length
# btn_duration_1.onTap ->
# 	for i in [0...highlight_range_array.length]
# 		highlight_range_array[i].animate
# 			minValue: clips[i].highlight[0] + btn_duration_diff
# 			maxValue: clips[i].highlight[1] - btn_duration_diff
# 			options:
# 				curve: "ease"
# 				time: 0.2
# 
# btn_duration_2.onTap ->
# 	for i in [0...highlight_range_array.length]
# 		highlight_range_array[i].animate
# 			minValue: clips[i].highlight[0] - btn_duration_diff
# 			maxValue: clips[i].highlight[1] + btn_duration_diff
# 			options:
# 				curve: "ease"
# 				time: 0.2

btn_duration_9s.onTap ->
	for i in [0...highlight_range_array.length]
		highlight_range_array[i].animate
			minValue: clips_highlights_ori[i][0]
			maxValue: clips_highlights_ori[i][1]
			options:
				curve: "ease"
				time: 0.2
	Utils.delay 0.2, ->
		update_highlight()
		
btn_duration_15s.onTap ->
	for i in [0...highlight_range_array.length]
		highlight_range_array[i].animate
			minValue: clips_highlights_15[i][0]
			maxValue: clips_highlights_15[i][1]
			options:
				curve: "ease"
				time: 0.2
	Utils.delay 0.2, ->
		update_highlight()

btn_duration_20s.onTap ->
	for i in [0...highlight_range_array.length]
		highlight_range_array[i].animate
			minValue: clips_highlights_20[i][0]
			maxValue: clips_highlights_20[i][1]
			options:
				curve: "ease"
				time: 0.2
	Utils.delay 0.2, ->
		update_highlight()	





# ===============================	

# clips_highlights = []
# for c in [0...clips.length]
# 	clips_highlights.push(clips[c].highlight)
# print clips_highlights

# duration 4 6 8 5
# clips_highlights_ori = [[1, 3], [2, 5], [4, 6], [1, 3], [4, 7]] # 12: 
# clips_highlights_ori = [[1, 3], [2, 5], [4, 6], [1, 3]] # 9: 2 3 2 2
# clips_highlights_15 = [[0, 3], [2, 6], [2, 7], [1, 4]] # 15: 3 4 5 3

sum_clips_highlights = (array) ->
	h_duration_array = 0
	for a in array
		a_duration = a[1]-a[0]
		h_duration_array += a_duration
	return h_duration_array


# ===============================	

# clip_editor.content.backgroundColor = ""
# Check if no need to scroll then disable scroll

c_num = clips.length
trimmer_all_h = clip_trim_cell_h * c_num
last_cell_max_y = screen_y + preview_area.height + duration_area_h + trimmer_all_h

if last_cell_max_y < Screen.height
	clip_editor.scrollVertical = false



# ===============================

update_highlight()

time_indicator.onTouchEnd ->
	circle.animate time: .15, delay: .1, curve: "ease-out", properties: scale: .8, opacity: 0

for h in highlight_range_array
	h.minKnob.onTouchEnd ->
		circle.animate time: .15, delay: .1, curve: "ease-out", properties: scale: .8, opacity: 0
	h.maxKnob.onTouchEnd ->
		circle.animate time: .15, delay: .1, curve: "ease-out", properties: scale: .8, opacity: 0

clip_editor.content.onTouchEnd ->
	circle.animate time: .15, delay: .1, curve: "ease-out", properties: scale: .8, opacity: 0


# ===============================
	

btn_circle_vis = new Layer
	width: 80
	height: 44
	y: Align.top
	x: Align.right
	backgroundColor: ""

btn_circle_vis.onTap ->
	if circle_vis is true
		circle_vis = false
	else
		circle_vis = true



# =============================== 

# today = new Date
# dd = String(today.getDate()).padStart(2, '0')
# mm = String(today.getMonth() + 1).padStart(2, '0')
# # #January is 0!
# yyyy = today.getFullYear()
# # today = mm + '/' + dd + '/' + yyyy
# today =  yyyy + '-' + mm + '-' + dd 
# 
# version_display = new TextLayer
# # 	parent: editor_page
# 	text: today
# # 	x: Align.center
# # 	x: 12
# # 	y: Screen.height * 0.1
# # 	y: 8
# # 	y: Align.center +40
# 	fontSize: 12
# 	color: "hsla(0,0%,100%,0.2)"
# 	backgroundColor: "hsl(0,0%,20%)"
# 	backgroundColor: ""
# 	padding: 
# 		horizontal: 22
# 		vertical: 8
# 
# version_display.onTap ->
# 	if @.opacity is 0 then @.opacity = 1 else @.opacity = 0
# 	
# 
# Utils.delay 3, ->
# 	version_display.opacity = 0



# ===============================

# ===============================

# init tab -> 1st
tab_area_array[0].children[0].image = "images/tab/#{data_tab_images[0].active}"


Utils.delay 0.5, ->
	update_current_tab(1)
	hide_timeline_thumb()
	
# Utils.delay 0.8, ->	
# 	update_current_trim_handler_color(0)

# create_pages(p = preview)
# update_page_slot()

# for i in [0...clips.length]
# 	timeline_array[i].backgroundColor = slot_array[i].color


btn_nav_back.onTap ->
	isShowSlotBorder = !isShowSlotBorder

btn_nav_back.onLongPress ->
	preview_color_mark.visible = !preview_color_mark.visible












