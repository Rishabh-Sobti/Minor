import numpy as np
import re
import click
import glob, os
from matplotlib import pylab as plt
import operator
import ntpath
@click.command()
@click.argument('files', nargs=-1, type=click.Path(exists=True))
def main(files):
    plt.style.use('ggplot')
    fig, ax1 = plt.subplots()
    ax1.set_xlabel('iteration')
    ax1.set_ylabel('loss')
    if not files:
        print('no args found')
        print('\n\rloading all files with .log extension from current directory')
        os.chdir(".")
        files = glob.glob("*.log")

    for i, log_file in enumerate(files):
        loss_iterations, losses, fileName = parse_log(log_file)
        disp_results(fig, ax1, loss_iterations, losses, fileName, color_ind=i)
    plt.show()


def parse_log(log_file):
    with open(log_file, 'r', encoding='utf-16') as log_file2:
        log = log_file2.read()

    loss_pattern = r"Iteration (\d\d?\d?) \("
    loss_pat2 = r", loss = (?P<loss_val>[+-]?(\d+(\.\d*)?|\.\d+)([eE][+-]?\d+)?)"
    losses = []
    loss_iterations = []

    fileName= os.path.basename(log_file)
    for r in re.findall(loss_pattern, log):
        l = len(r)
        if l==1:
            loss_iterations.append(int(r[0]))
        if l==2:
            loss_iterations.append(int(r[0])*10+int(r[1]))
        if l==3:
            loss_iterations.append(int(r[0])*100+int(r[1])*10+int(r[2]))
    for r in re.findall(loss_pat2, log):
        losses.append(float(r[0]))

    loss_iterations = np.array(loss_iterations)
    losses = np.array(losses)
	
    return loss_iterations, losses, fileName


def disp_results(fig, ax1, loss_iterations, losses, fileName, color_ind=0):
    #modula = len(plt.rcParams['axes.prop_cycle'])
    ax1.plot(loss_iterations, losses)
    plt.legend(loc='lower right') 


if __name__ == '__main__':
    main()
