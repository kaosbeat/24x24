
String seed = "001101110101011111010011";
String seed10  = seed + seed + seed + seed + seed + seed + seed + seed + seed + seed;
char []row = seed.toCharArray();
String newRow = "";
int curchar = 0;
int currow = 0;
int x,y,z;
float seedprob = 0.5;
PGraphics cag;

void setup (){
    size(240,240);
    cag = createGraphics(24, 24);
    x = 0;
    y = 0;
    z = 0;
}

void draw () {
    int mult = 10;
    background(255);
    cag.beginDraw();
    cag.background(255);
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
                for (int j = 0; j < mult; ++j) {
                    for (int k = 0;k < mult; ++k) {
                        set(i*mult+j, currow*mult+k, black);                      
                    }
                }
                cag.set(i, currow,black);
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
    cag.endDraw();
    // image(cag,0,0,width,height);
    currow = 0;
    noLoop();
        
}

String dateToString(){
    String date = "";
    date = "_" + year() + "-" + month() + "-" + day() + "_" + hour() + "." + minute() + "." + second();
    return date;
}

void keyPressed() {
    if (key == ' ') {
        cag.save("CA" + "_" + rulestring + "_" + seed + dateToString() + ".png");
    }

    if (key == 's') {
        randomRulenumber();
        loop();
        println(rulenumber);
    }

    if (key == 'r') {
        reseed();
        loop();
        println(seed);
    }

    if (key == 'R') {
        seedprob = random(0,1);
        loop();
        // println(seedprob);
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
    // println(row);

}

int []rulenumber = {1,0,0,1,1,1,1,1,0};
String rulestring = "100111110";

void randomRulenumber() {
    rulestring = "";
    for (int i = 0; i < rulenumber.length; ++i) {
        rulenumber[i] = int(random(0,2));
        rulestring = rulestring + str(rulenumber[i]);
    }
    println(rulestring);
}



String rule(int x,int y,int z){
    if(x==1 && y==1 && z==1){
        return str(rulenumber[0]);
    }
    else if(x==1 && y==1 && z==0){
        return str(rulenumber[1]);
    }
    else if(x==1 && y==0 && z==1){
        return str(rulenumber[2]);
    }
    else if(x==1 && y==0 && z==0){
        return str(rulenumber[3]);
    }
    else if(x==0 && y==1 && z==1){
        return str(rulenumber[4]);
    }
    else if(x==0 && y==1 && z==0){
        return str(rulenumber[5]);
    }
    else if(x==0 && y==0 && z==1){
        return str(rulenumber[6]);
    }
    else { 
        return str(rulenumber[7]);
    }

}  



