
import pygame

stat = pygame.init()

# print(stat)

window_1 = pygame.display.set_mode((500,500))

#apne game mein time ki bachodi na ho isliye...
clock_bhai = pygame.time.Clock()

#tuime passed between two frames..
dt = 0
speed = pygame.Vector2(0 , 0)

#window khuli rakhne ke liye...
running = True
circle_radius = 20
player_pos = pygame.Vector2(window_1.get_width()/2, window_1.get_height()/2)

while running:

	window_1.fill("black")

	for event in pygame.event.get():
		if event.type == pygame.QUIT:
			running = False

	player_pos += speed * dt
	gola = pygame.draw.circle(window_1,"white",player_pos,20)

	# #
	# if player_pos.y >= window_1.get_height() -25 :
	# 	speed.y *= -1
	# # elif player_pos.y >= window_1.get_width() -25 :
	# 	# speed.y *= -1
	# elif player_pos.x >= window_1.get_height() -25 :
	# 	speed.x *= -1
	# # elif player_pos.x >= window_1.get_width() -25 :
	# 	# speed.x *= -1

	keys = pygame.key.get_pressed()
	if keys[pygame.K_w]:
		player_pos.y -= 300 * dt
	if keys[pygame.K_s]:
		player_pos.y += 300 * dt
	if keys[pygame.K_a]: 
		player_pos.x -= 300*dt
	if keys[pygame.K_d]:
		player_pos.x += 300*dt
	if keys[pygame.K_q]:
		pygame.quit()


	if player_pos.x >= (window_1.get_width() + (circle_radius)):
	   player_pos.x = 0 - 50

	#flip the fucking screen ...
	pygame.display.flip()

	dt = clock_bhai.tick(60)/1000
	print(dt)
pygame.quit()