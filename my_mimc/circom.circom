pragma circom 2.1.6;

template MiMC5() {
    signal input x;
    signal input k;
    signal output h;

    var nRounds = 10;

    var c[nRounds] = [
        0,
        63615047936147080091128276878624520568970112421291939377257059077464663643212,
        46915762090843286135476729080136566377504231279369210024545177747495010273470,
        38194629105809675375869883429937357152836080976156310453905800506495946708095,
        18663141426003549036609914666156149390928241758227902150661781759387193038663,
        2228862683679103021474414907103262266598336495131504555355231584911320008658,
        82228946280689688794761046297051466644191230067739730831344386934825845343801,
        11713308384634833935604892424983718860767763850880125621194852538627163108723,
        68050007546297834843934064760246850345360493219881487970432788363577582702120,
        62384162263742941335690743575932254901713313385289258518176757918798011397676
    ];

    signal lastOutput[nRounds + 1];
    var base[nRounds];
    signal base2[nRounds];
    signal base4[nRounds];

    lastOutput[0] <== x;
    
    for(var i = 0; i < nRounds; i++) {
        base[i] = lastOutput[i] + k + c[i];
        base2[i] <== base[i] * base[i];
        base4[i] <== base2[i] * base2[i];

        lastOutput[i + 1] <== base4[i] * base[i];
    } 

    h <== lastOutput[nRounds] + k;
    
}

component main = MiMC5();