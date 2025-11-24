# 文字をランダムに雨のように降らす
import random, shutil, time, os

width = shutil.get_terminal_size().columns
chars = "ｱｲｳｴｵｶｷｸｹｺｻｼｽｾｿ0123456789abcdefghijklmnopqrstuvwxyz"

streams = [random.randint(-20, 0) for _ in range(width)]
try:
    while True:
        line = []
        for i, pos in enumerate(streams):
            if pos > 0 and random.random() > 0.2:
                line.append(random.choice(chars))
            else:
                line.append(' ')
            streams[i] = pos + 1 if pos < random.randint(5, 20) else random.choice([-random.randint(1,20), 0])
        os.system('cls' if os.name == 'nt' else 'clear')
        print(''.join(line))
        time.sleep(0.05)
except KeyboardInterrupt:
    print("\nbye")
