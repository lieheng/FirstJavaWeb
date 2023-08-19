package Code;

public class Log {
    String DATETIME = null;
    String MYQTH = null;
    String MYDEV = null;
    String MYANT = null;
    String OPCS = null;
    Float FREQ = null;
    String MODE = null;
    Integer MYRST = null;
    Integer OPRST = null;
    Float MYPOWER = null;
    Float OPPOWER = null;
    String OPQTH = null;
    String OPDEV = null;
    String OPANT = null;
    String ABSTR = null;
    String QSL = null;

    public Log(String DATETIME, String MYQTH, String MYDEV, String MYANT, String OPCS, Float FREQ, String MODE, Integer MYRST, Integer OPRST, Float MYPOWER, Float OPPOWER, String OPQTH, String OPDEV, String OPANT, String ABSTR, String QSL) {
        this.DATETIME = DATETIME;
        this.MYQTH = MYQTH;
        this.MYDEV = MYDEV;
        this.MYANT = MYANT;
        this.OPCS = OPCS;
        this.FREQ = FREQ;
        this.MODE = MODE;
        this.MYRST = MYRST;
        this.OPRST = OPRST;
        this.MYPOWER = MYPOWER;
        this.OPPOWER = OPPOWER;
        this.OPQTH = OPQTH;
        this.OPDEV = OPDEV;
        this.OPANT = OPANT;
        this.ABSTR = ABSTR;
        this.QSL = QSL;
    }

    public String getDATETIME() {
        return DATETIME;
    }

    public void setDATETIME(String DATETIME) {
        this.DATETIME = DATETIME;
    }

    public String getMYQTH() {
        return MYQTH;
    }

    public void setMYQTH(String MYQTH) {
        this.MYQTH = MYQTH;
    }

    public String getMYDEV() {
        return MYDEV;
    }

    public void setMYDEV(String MYDEV) {
        this.MYDEV = MYDEV;
    }

    public String getMYANT() {
        return MYANT;
    }

    public void setMYANT(String MYANT) {
        this.MYANT = MYANT;
    }

    public String getOPCS() {
        return OPCS;
    }

    public void setOPCS(String OPCS) {
        this.OPCS = OPCS;
    }

    public Float getFREQ() {
        return FREQ;
    }

    public void setFREQ(Float FREQ) {
        this.FREQ = FREQ;
    }

    public String getMODE() {
        return MODE;
    }

    public void setMODE(String MODE) {
        this.MODE = MODE;
    }

    public Integer getMYRST() {
        return MYRST;
    }

    public void setMYRST(Integer MYRST) {
        this.MYRST = MYRST;
    }

    public Integer getOPRST() {
        return OPRST;
    }

    public void setOPRST(Integer OPRST) {
        this.OPRST = OPRST;
    }

    public Float getMYPOWER() {
        return MYPOWER;
    }

    public void setMYPOWER(Float MYPOWER) {
        this.MYPOWER = MYPOWER;
    }

    public Float getOPPOWER() {
        return OPPOWER;
    }

    public void setOPPOWER(Float OPPOWER) {
        this.OPPOWER = OPPOWER;
    }

    public String getOPQTH() {
        return OPQTH;
    }

    public void setOPQTH(String OPQTH) {
        this.OPQTH = OPQTH;
    }

    public String getOPDEV() {
        return OPDEV;
    }

    public void setOPDEV(String OPDEV) {
        this.OPDEV = OPDEV;
    }

    public String getOPANT() {
        return OPANT;
    }

    public void setOPANT(String OPANT) {
        this.OPANT = OPANT;
    }

    public String getABSTR() {
        return ABSTR;
    }

    public void setABSTR(String ABSTR) {
        this.ABSTR = ABSTR;
    }

    public String getQSL() {
        return QSL;
    }

    public void setQSL(String QSL) {
        this.QSL = QSL;
    }
}
