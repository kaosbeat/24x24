
String seed = "001101110101011111010011";
char []row = seed.toCharArray();
String newRow = "";
int curchar = 0;
int currow = 0;
int x,y,z;
float seedprob = 0.5;


void setup (){
    size(24,24);
    x = 0;
    y = 0;
    z = 0;
}

void draw () {
    background(255);
    color black = color(0);
    while (currow < row.length) {
        for (int i = 0; i < row.length; i++) {
            // println("x is " + (int(row[i] - '0' )));
            if (i == 0){
                x = int(row[row.length-1] - '0');
            } else {
                x = int(row[i-1] - '0');   
            }
            if (row[i] == '1') {
                set(i, currow, black);
                y = 1;
            } else {
                y = 0;
            }
            if (i == row.length-1){
                z = int(row[0] - '0') ; 
            } else {
                z = int(row[i+1] - '0'); 
            }        
            newRow = newRow + rule(x, y, z);
        }
        row=newRow.toCharArray();
        newRow = "";
        currow++;
    }
    currow = 0;
    // noLoop();
        
}

String dateToString(){
    String date = "";
    date = "_" + year() + "-" + month() + "-" + day() + "_" + hour() + "." + minute() + "." + second();
    return date;
}

void keyPressed() {
    if (key == ' ') {
        save("output" + dateToString() + ".png");
    }

    if (key == 'r') {
        reseed();
    }

    if (key == 'R') {
        seedprob = random(0,1);
        println(seedprob);
    }
}
void reseed () {
    seed = "";

    for (int i = 0; i < row.length; i++) {
        if (random(1) < seedprob) {
            seed = seed + "1";
        } else {
            seed = seed + "0";
        }
    }
    row = seed.toCharArray();
    println(row);

}



String rule(int x,int y,int z){
    if(x==1 && y==1 && z==1){
        return str(1);
    }
    else if(x==1 && y==1 && z==0){
        return str(0);
    }
    else if(x==1 && y==0 && z==1){
        return str(0);
    }
    else if(x==1 && y==0 && z==0){
        return str(1);
    }
    else if(x==0 && y==1 && z==1){
        return str(1);
    }
    else if(x==0 && y==1 && z==0){
        return str(1);
    }
    else if(x==0 && y==0 && z==1){
        return str(1);
    }
    else { 
        return str(0);
    }

}  
