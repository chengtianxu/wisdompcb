unit Frm_main_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, StdCtrls, Buttons, ExtCtrls, Menus, OleServer, Excel2000,
  ComObj,ComCtrls, Provider, jpeg,strUtils,dateutils, DBGridEh,IniFiles,
  DB, ADODB ;
type
  TFrm_main = class(TForm)
    OpenDialog1: TOpenDialog;
    ProgressBar2: TProgressBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Image1: TImage;
    Label11: TLabel;
    Label12: TLabel;
    Label13: TLabel;
    StringGrid1: TStringGrid;
    BitBtn1: TBitBtn;
    Button1: TButton;
    Button2: TButton;
    ComboBox1: TComboBox;
    TabSheet2: TTabSheet;
    Label6: TLabel;
    Label7: TLabel;
    Label8: TLabel;
    Label9: TLabel;
    Label10: TLabel;
    Image2: TImage;
    Label14: TLabel;
    StringGrid2: TStringGrid;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    TabSheet3: TTabSheet;
    Label33: TLabel;
    Label_localip: TLabel;
    pnl1: TPanel;
    Label15: TLabel;
    Label17: TLabel;
    Label16: TLabel;
    Panel1: TPanel;
    Label18: TLabel;
    Label19: TLabel;
    Label20: TLabel;
    Label21: TLabel;
    Label22: TLabel;
    Label23: TLabel;
    Label24: TLabel;
    Label25: TLabel;
    Label26: TLabel;
    Label_emprkeya: TLabel;
    Label27: TLabel;
    Label28: TLabel;
    Label_emprkeyb: TLabel;
    Label30: TLabel;
    Label31: TLabel;
    Label29: TLabel;
    Label32: TLabel;
    Label_db: TLabel;
    Label34: TLabel;
    Label35: TLabel;
    Label36: TLabel;
    Label_con3: TLabel;
    ComboBox2: TComboBox;
    Edit1: TEdit;
    Edit2: TEdit;
    BitBtn6: TBitBtn;
    DateTimePicker1: TDateTimePicker;
    DateTimePicker2: TDateTimePicker;
    BitBtn7: TBitBtn;
    pnl2: TPanel;
    DBGridEh1: TDBGridEh;
    StringGrid3: TStringGrid;
    pnl3: TPanel;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    lbl4: TLabel;
    BitBtn8: TBitBtn;
    BitBtn9: TBitBtn;
    btn1: TBitBtn;
    BitBtn14: TBitBtn;
    stxt1: TStaticText;
    btn2: TBitBtn;
    TabSheet4: TTabSheet;
    TabSheet5: TTabSheet;
    Label37: TLabel;
    Label38: TLabel;
    Label39: TLabel;
    Label40: TLabel;
    Label41: TLabel;
    Label42: TLabel;
    StringGrid5: TStringGrid;
    BitBtn10: TBitBtn;
    BitBtn11: TBitBtn;
    BitBtn12: TBitBtn;
    BitBtn13: TBitBtn;
    TabSheet7: TTabSheet;
    BitBtn15: TBitBtn;
    BitBtn16: TBitBtn;
    BitBtn17: TBitBtn;
    BitBtn18: TBitBtn;
    StringGrid6: TStringGrid;
    Label43: TLabel;
    Label44: TLabel;
    Label45: TLabel;
    Label46: TLabel;
    Label47: TLabel;
    Label48: TLabel;
    Panel2: TPanel;
    lbl5: TLabel;
    Panel3: TPanel;
    dbgrdh1: TDBGridEh;
    Panel4: TPanel;
    pnl4: TPanel;
    demo: TLabel;
    BitBtn19: TBitBtn;
    pnl5: TPanel;
    Label49: TLabel;
    Label50: TLabel;
    Label51: TLabel;
    Label52: TLabel;
    btn3: TBitBtn;
    edt1: TEdit;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    qry1: TADOQuery;
    ds1: TDataSource;
    Label53: TLabel;
    TabSheet6: TTabSheet;
    sgPhone: TStringGrid;
    BitBtn20: TBitBtn;
    BitBtn21: TBitBtn;
    BitBtn22: TBitBtn;
    BitBtn23: TBitBtn;
    Label54: TLabel;
    tsList: TTabSheet;
    sgList: TStringGrid;
    btn4: TBitBtn;
    btn6: TBitBtn;
    btn5: TBitBtn;
    btn7: TBitBtn;
    edt2: TEdit;
    lbl6: TLabel;
    lbl7: TLabel;
    Label55: TLabel;
    DBGridEh2: TDBGridEh;
    DataSource1: TDataSource;
    procedure BitBtn1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure ComboBox2Change(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
    procedure BitBtn8Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure BitBtn9Click(Sender: TObject);
    procedure BitBtn10Click(Sender: TObject);
    procedure BitBtn11Click(Sender: TObject);
    procedure BitBtn12Click(Sender: TObject);
    procedure BitBtn13Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure BitBtn14Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure BitBtn15Click(Sender: TObject);
    procedure BitBtn16Click(Sender: TObject);
    procedure BitBtn17Click(Sender: TObject);
    procedure BitBtn18Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure BitBtn19Click(Sender: TObject);
    procedure BitBtn23Click(Sender: TObject);
    procedure BitBtn22Click(Sender: TObject);
    procedure BitBtn21Click(Sender: TObject);
    procedure BitBtn20Click(Sender: TObject);
    procedure btn4Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
    procedure btn7Click(Sender: TObject);
   
  private
    FTag : Integer;
    field_name:string;
    oper_name:string;
    sSql :string;
    program_ini: TIniFile;
    FileName: string;
    procedure ExcelToDB;
    procedure ExcelToDB_1;
    procedure ExcelToDB_2;
    procedure ExcelToDB_5;
    procedure ExcelToDB_6;
  public
    { Public declarations }
  end;

var
  Frm_main: TFrm_main;

implementation
uses common,ConstVar,Pick_Item_Single,damo;
{$R *.dfm}

procedure TFrm_main.ExcelToDB;
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
begin
   if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
   Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
        XLApp.DisplayAlerts := False;
        XLApp.Quit;
        VarClear(XLApp);
   end;
   try
        XLApp := CreateOleObject('Excel.Application');
        limit := 0;
   except
        Screen.Cursor := crDefault;
        Exit;
   end;
  
  try
       XLApp.workBooks.Open(fileName);
       Sheet := XLApp.Workbooks[1].WorkSheets[1];
       for iCount:=1 to 50000 do
       begin
                 if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '')
                 and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
                 begin
                  stringgrid1.Cells[0,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);
                  stringgrid1.Cells[1,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]);
                  stringgrid1.Cells[2,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,3]);
                  stringgrid1.Cells[3,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,4]);
                  stringgrid1.Cells[4,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,5]);
                  stringgrid1.Cells[5,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,6]);
                  stringgrid1.Cells[6,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,7]);
                  stringgrid1.Cells[7,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,8]);
                  stringgrid1.Cells[8,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,9]);
                  stringgrid1.Cells[9,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,10]);
                  stringgrid1.Cells[10,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,11]);
                  stringgrid1.Cells[11,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,12]);
                  stringgrid1.Cells[12,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,13]);
                  stringgrid1.Cells[13,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,14]);
                  stringgrid1.Cells[14,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,15]);
                  stringgrid1.Cells[15,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,16]);
                  stringgrid1.Cells[16,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,17]);
                  stringgrid1.Cells[17,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,18]);
                  stringgrid1.Cells[18,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,19]);
                  stringgrid1.Cells[19,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,20]);
                  stringgrid1.Cells[20,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,21]);
                  stringgrid1.Cells[21,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,22]);
                  stringgrid1.Cells[22,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,23]);
                  stringgrid1.Cells[23,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,24]);
                  stringgrid1.Cells[24,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,25]);
                  stringgrid1.Cells[25,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,26]);
                  stringgrid1.Cells[26,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,27]);
                  stringgrid1.Cells[27,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,28]);
                  stringgrid1.Cells[28,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,29]);
                  stringgrid1.Cells[29,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,30]);
                  stringgrid1.Cells[30,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,31]);
                  stringgrid1.Cells[31,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,32]);
                  stringgrid1.Cells[32,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,33]);
                  stringgrid1.Cells[33,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,34]);
                  stringgrid1.RowCount := iCount;
                  application.ProcessMessages;
                 end
                 else begin
                       Inc(limit);
                       if limit >= 6 then
                       Break;
                 end;
       end;
       stringgrid1.ColWidths[0] := 60;
       stringgrid1.ColWidths[1] := 60;
       XLApp.workbooks[1].close;
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   stringgrid1.Refresh;
   stringgrid1.FixedRows := 1;
end;

procedure TFrm_main.ExcelToDB_1;
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
begin
   if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
   Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
        XLApp.DisplayAlerts := False;
        XLApp.Quit;
        VarClear(XLApp);
   end;
   try
        XLApp := CreateOleObject('Excel.Application');
        limit := 0;
   except
        Screen.Cursor := crDefault;
        Exit;
   end;

  try
       XLApp.workBooks.Open(fileName);
       Sheet := XLApp.Workbooks[1].WorkSheets[1];
       for iCount:=1 to 50000 do
       begin
                 if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '')
                 and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
                 begin
                  stringgrid2.Cells[0,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);
                  stringgrid2.Cells[1,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]);
                  stringgrid2.Cells[2,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,3]);
                  stringgrid2.Cells[3,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,4]);
                  stringgrid2.Cells[4,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,5]);
                  stringgrid2.Cells[5,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,6]);
                  stringgrid2.Cells[6,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,7]);
                  stringgrid2.Cells[7,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,8]);
                  stringgrid2.Cells[8,iCount-1] := inttostr(iCount-1);
                  stringgrid2.RowCount := iCount;
                  application.ProcessMessages;
                 end
                 else begin
                       Inc(limit);
                       if limit >= 6 then
                       Break;
                 end;
       end;
       stringgrid2.ColWidths[0] := 60;
       stringgrid2.ColWidths[1] := 60;
       XLApp.workbooks[1].close;
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   stringgrid2.Refresh;
   stringgrid2.FixedRows := 1;
end;

procedure TFrm_main.ExcelToDB_2;
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
begin
   if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
   Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
        XLApp.DisplayAlerts := False;
        XLApp.Quit;
        VarClear(XLApp);
   end;
   try
        XLApp := CreateOleObject('Excel.Application');
        limit := 0;
   except
        Screen.Cursor := crDefault;
        Exit;
   end;

  try
       XLApp.workBooks.Open(fileName);
       Sheet := XLApp.Workbooks[1].WorkSheets[1];
       for iCount:=1 to 50000 do
       begin
                 if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '')
                 and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
                 begin
                  stringgrid3.Cells[0,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);
                  stringgrid3.Cells[1,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]); 
                  stringgrid3.Cells[7,iCount-1] := inttostr(iCount-1);
                  stringgrid3.RowCount := iCount;
                  application.ProcessMessages;
                 end
                 else begin
                       Inc(limit);
                       if limit >= 6 then
                       Break;
                 end;
       end;
       XLApp.workbooks[1].close;
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;

   stringgrid3.ColWidths[7] :=0;
   stringgrid3.Refresh;
   stringgrid3.FixedRows := 1;
end;

procedure TFrm_main.ExcelToDB_5;
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
begin
   if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
   Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
        XLApp.DisplayAlerts := False;
        XLApp.Quit;
        VarClear(XLApp);
   end;
   try
        XLApp := CreateOleObject('Excel.Application');
        limit := 0;
   except
        Screen.Cursor := crDefault;
        Exit;
   end;

  try
       XLApp.workBooks.Open(fileName);
       Sheet := XLApp.Workbooks[1].WorkSheets[1];
       for iCount:=1 to 50000 do
       begin
                 if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '')
                 and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
                 begin
                  stringgrid5.Cells[0,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);
                  stringgrid5.Cells[1,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]);
                  stringgrid5.Cells[2,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,3]);
                  stringgrid5.Cells[3,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,4]);
                  stringgrid5.Cells[8,iCount-1] := inttostr(iCount-1);
                  stringgrid5.RowCount := iCount;
                  application.ProcessMessages;
                 end
                 else begin
                       Inc(limit);
                       if limit >= 6 then
                       Break;
                 end;
       end;
       stringgrid5.ColWidths[0] := 60;
       stringgrid5.ColWidths[1] := 60;
       XLApp.workbooks[1].close;
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   stringgrid5.Refresh;
   stringgrid5.FixedRows := 1;
end;

procedure TFrm_main.ExcelToDB_6;
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
begin
   if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
   Screen.Cursor := crHourGlass;
   if not VarIsEmpty(XLApp) then
   begin
        XLApp.DisplayAlerts := False;
        XLApp.Quit;
        VarClear(XLApp);
   end;
   try
        XLApp := CreateOleObject('Excel.Application');
        limit := 0;
   except
        Screen.Cursor := crDefault;
        Exit;
   end;

  try
       XLApp.workBooks.Open(fileName);
       Sheet := XLApp.Workbooks[1].WorkSheets[1];
       for iCount:=1 to 50000 do
       begin
                 if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '')
                 and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
                 begin
                  stringgrid6.Cells[0,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);
                  stringgrid6.Cells[1,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]);
                  stringgrid6.Cells[2,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,3]);
                  stringgrid6.Cells[3,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,4]);
                  stringgrid6.Cells[8,iCount-1] := inttostr(iCount-1);
                  stringgrid6.RowCount := iCount;
                  application.ProcessMessages;
                 end
                 else begin
                       Inc(limit);
                       if limit >= 6 then
                       Break;
                 end;
       end;
       stringgrid6.ColWidths[0] := 60;
       stringgrid6.ColWidths[1] := 60;
       XLApp.workbooks[1].close;
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   stringgrid6.Refresh;
   stringgrid6.FixedRows := 1;
end;


procedure TFrm_main.BitBtn1Click(Sender: TObject);
begin
ExcelToDB;
stringgrid1.Cells[0,0] := '员工编号';
stringgrid1.Cells[1,0] := '姓名';
stringgrid1.Cells[2,0] := '1';
stringgrid1.Cells[3,0] := '2';
stringgrid1.Cells[4,0] := '3';
stringgrid1.Cells[5,0] := '4';
stringgrid1.Cells[6,0] := '5';
stringgrid1.Cells[7,0] := '6';
stringgrid1.Cells[8,0] := '7';
stringgrid1.Cells[9,0] := '8';
stringgrid1.Cells[10,0] := '9';
stringgrid1.Cells[11,0] := '10';
stringgrid1.Cells[12,0] := '11';
stringgrid1.Cells[13,0] := '12';
stringgrid1.Cells[14,0] := '13';
stringgrid1.Cells[15,0] := '14';
stringgrid1.Cells[16,0] := '15';
stringgrid1.Cells[17,0] := '16';
stringgrid1.Cells[18,0] := '17';
stringgrid1.Cells[19,0] := '18';
stringgrid1.Cells[20,0] := '19';
stringgrid1.Cells[21,0] := '20';
stringgrid1.Cells[22,0] := '21';
stringgrid1.Cells[23,0] := '22';
stringgrid1.Cells[24,0] := '23';
stringgrid1.Cells[25,0] := '24';
stringgrid1.Cells[26,0] := '25';
stringgrid1.Cells[27,0] := '26';
stringgrid1.Cells[28,0] := '27';
stringgrid1.Cells[29,0] := '28';
stringgrid1.Cells[30,0] := '29';
stringgrid1.Cells[31,0] := '30';
stringgrid1.Cells[32,0] := '31';
label5.Caption := inttostr(stringgrid1.RowCount-1);
end;

procedure TFrm_main.Button1Click(Sender: TObject);
var itmp,a,b,c,i,j: integer;
begin
for i := 1 to stringgrid1.RowCount-1 do
begin
  for j:=1 to 31 do
  begin
    stringgrid1.Cells[i,j]:=trim(stringgrid1.Cells[i,j]);
  end;
end;
end;

procedure TFrm_main.Button2Click(Sender: TObject);
var itmp,i,row,k: integer;
begin

   if (strtoint(vprev)=1) then
   begin
      showmessage('权限不够');
      abort;
   end;


  if Messagedlg('你确定给月份 '+combobox1.Text+'，列表中的员工重新排班吗?',mtWarning,[mbYES,mbNO],0)=6 then
  begin
    bitbtn1.Enabled := false;
    button1.Enabled := false;
    button2.Enabled := false;
    k:= strtoint(RightStr(DateToStr(EndOfTheMonth(strToDate(combobox1.Text+'-01'))),2));
    itmp := 1;
    dm.ADOQuery1.SQL.Clear;
    dm.ADOQuery1.SQL.Text := 'create table #onoffdutydata(rkey int,checkdate datetime,'+
      'employeeid int,classid int,employeecode nvarchar(20),chinesename nvarchar(20),'+
      'classname nvarchar(20))';
    dm.ADOQuery1.ExecSQL;
     try
      for i:=1 to k do
        begin
          for row:=1 to  stringgrid1.RowCount-1 do
            begin
              dm.ADOQuery1.SQL.Clear;
              if i<10 then
                begin
                  dm.ADOQuery1.SQL.Text := 'insert into #onoffdutydata '+
                    '  select  0,'+#39+combobox1.Text+'-0'+stringgrid1.Cells[i+1,0]+#39+',0,0,'+ //RKEY,CHECKDATE,EMPLOYEEID,CLASSID
                    #39+stringgrid1.Cells[0,row]+#39+','+ #39+stringgrid1.Cells[1,row]+#39+','+  //EMPLOYEECODE  ,chinesename
                    #39+stringgrid1.Cells[i+1,row]+#39;
                  dm.ADOQuery1.ExecSQL;
                  itmp := itmp+1;
                  progressbar2.Position := Trunc(itmp/(stringgrid1.RowCount*k)*90);
                  application.ProcessMessages;
                end
              else
                begin
                  dm.ADOQuery1.SQL.Text := 'insert into #onoffdutydata '+
                    '  select  0,'+#39+combobox1.Text+'-'+stringgrid1.Cells[i+1,0]+#39+',0,0,'+ //RKEY,CHECKDATE,EMPLOYEEID,CLASSID
                    #39+stringgrid1.Cells[0,row]+#39+','+ #39+stringgrid1.Cells[1,row]+#39+','+  //EMPLOYEECODE  ,chinesename
                    #39+stringgrid1.Cells[i+1,row]+#39;
                  dm.ADOQuery1.ExecSQL;
                  itmp := itmp+1;
                  progressbar2.Position := Trunc(itmp/(stringgrid1.RowCount*k)*90);
                  application.ProcessMessages;
                end;
            end;
        end;
      dm.ADOQuery2.ExecSQL;
     finally
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text := 'drop table #onoffdutydata';
      dm.ADOQuery1.ExecSQL;
      bitbtn1.Enabled := true;
      button1.Enabled := true;
      button2.Enabled := true;
      progressbar2.Position := 100 ;
      application.ProcessMessages;
      showmessage('导入完毕');
    end;
  end;
end;

procedure TFrm_main.FormCreate(Sender: TObject);
const
  DB_ID = 'INITIAL CATALOG=';
  IP_ID = 'DATA SOURCE=';
var
i: integer;
yearmonth,connstr: string;
begin
 if not app_init(dm.ADOConnection1) then
  begin
    common.ShowMsg('程序启动失败,请联系系统管理员',1);
    application.Terminate;
    exit;
  end;
  Caption := application.Title;

  //
   { dm.ADOConnection1.Open;
 //
  user_ptr := '3';
 //
  vprev := '4';   }
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  dm.ADOQuery1.SQL.Clear;
  dm.ADOQuery1.SQL.Text :='select employee_name from data0005 where rkey='+user_ptr;
  dm.ADOQuery1.Open;

  if not dm.ADOQuery1.IsEmpty then
  begin
    oper_name := dm.ADOQuery1.FieldValues['employee_name'];
  end;
  dm.ADOConnection1.Close;
  dm.ADOQuery1.SQL.Clear;

    dm.ADOQuery1.SQL.Text :='select top 1 rkey from data0073 where employee_ptr='+user_ptr;
  dm.ADOQuery1.Open;

  if not dm.ADOQuery1.IsEmpty then
  begin
    rkey73 := dm.ADOQuery1.fieldbyname('rkey').AsString;
  end;
  dm.ADOConnection1.Close;
  dm.ADOQuery1.SQL.Clear;




  //初始化下拉框
  combobox1.Items.Clear;
  for i:=-3 to 0 do
    begin
      yearmonth :=formatdatetime('yyyy-mm-dd ',incMonth(now,i));
      combobox1.Items.Add(copy(yearmonth,1,7));
    end;
  combobox1.ItemIndex := 3;
  //
  pagecontrol1.ActivePageIndex := 0 ;
  //初始化时间选择器
  datetimepicker1.Date := strtodate(copy(formatdatetime('yyyy-mm-dd ',incMonth(now,-1)),1,7)+'-01');
  datetimepicker2.Date := incday(incMonth(datetimepicker1.Date,1),-1);
  //跨区复制
  filename:=Extractfilepath(ParamStr(0))+'WISDOMPCB.ini';
  program_ini:=Tinifile.Create(filename);
  program_ini.ReadSection('数据库',combobox2.Items);
  connstr:=dm.ADOConnection1.ConnectionString;
  Label_localip.Caption:= ExtractSpecValue(connstr, IP_ID);
  //过滤本IP的服务器
  for i:=combobox2.Items.Count-1 downto 0 do
  begin
  if  program_ini.ReadString('服务器',ComboBox2.Items[i],'')=Label_localip.Caption
  then
    begin
      combobox2.Items.Delete(i); 
    end;
  end;
  combobox2.ItemIndex := 0;
  edit1.Text:=program_ini.ReadString('服务器',combobox2.Text,'');
  Label_db.Caption := program_ini.ReadString('数据库',combobox2.Text,'');

end;


procedure TFrm_main.PageControl1Change(Sender: TObject);
begin

  if ( pagecontrol1.ActivePageIndex in [1,2,4,5,6])
  and ((strtoint(vprev)=1) or (strtoint(vprev)=2) or (strtoint(vprev)=3)) then
  begin
    messagedlg('对不起!您没有该程序的可写权限,需写银权限',mtinformation,[mbok],0);
    pagecontrol1.ActivePageIndex := 0;
    abort;
  end;

  if (pagecontrol1.ActivePageIndex=1) then
  begin
    stringgrid2.Cells[0,0] := '员工工号';
    stringgrid2.Cells[1,0] := '姓名';
    stringgrid2.Cells[2,0] := '考勤日期';
    stringgrid2.Cells[3,0] := '正班';
    stringgrid2.Cells[4,0] := '加班';
    stringgrid2.Cells[5,0] := '迟到';
    stringgrid2.Cells[6,0] := '早退';
    stringgrid2.Cells[7,0] := '旷工';
  end;
    if (pagecontrol1.ActivePageIndex=2) then
  begin
    //复制考勤
    ComboBox2.OnChange(sender);
    stringgrid3.Cells[0,0] := '本厂工号';//
    stringgrid3.Cells[1,0] := '姓名'; //
    stringgrid3.Cells[2,0] := '本厂确认'; //n_rkey or error
    stringgrid3.Cells[3,0] := '身份证'; //ok or error
    stringgrid3.Cells[4,0] := '外厂工号'; // w_rkey
    stringgrid3.Cells[5,0] := '外厂确认'; //w_rkey
    stringgrid3.Cells[6,0] := '复制结果'; // or 0
    stringgrid3.Cells[7,0] := '序号';
    btn1.Enabled := true;
    BitBtn14.Enabled := false;
  end;
  if (pagecontrol1.ActivePageIndex=3) then
  begin
       dtp1.Date :=strToDate(formatdatetime('yyyy-mm-',now)+'01');
       dtp2.Date :=EndOfTheMonth(dtp1.Date);
  end;
  if (pagecontrol1.ActivePageIndex=4) then
  begin
    stringgrid5.Cells[0,0] := '员工工号';
    stringgrid5.Cells[1,0] := '姓名';
    stringgrid5.Cells[2,0] := '岗位';
    stringgrid5.Cells[3,0] := '籍贯';
    stringgrid5.ColWidths[9] := 300;
    stringgrid5.ColWidths[3] := 120;
  end;
    if (pagecontrol1.ActivePageIndex=5) then
  begin
    stringgrid6.Cells[0,0] := '员工工号';
    stringgrid6.Cells[1,0] := '姓名';
    stringgrid6.Cells[2,0] := '社保卡帐号';
    stringgrid6.Cells[3,0] := '公积金帐号';
    stringgrid6.ColWidths[9] := 300;
    stringgrid6.ColWidths[3] := 120;
  end;
    if (pagecontrol1.ActivePageIndex=6) then
  begin
    sgPhone.Cells[0,0] := '员工工号';
    sgPhone.Cells[1,0] := '姓名';
    sgPhone.Cells[2,0] := '电话号码';
//    sgPhone.Cells[3,0] := '错误说明';
  end;
  if (pagecontrol1.ActivePageIndex=7) then
  begin
    sgList.Cells[0,0] := '员工工号';
    sgList.Cells[1,0] := '姓名';
    sgList.Cells[2,0] := '补助年月';
    sgList.Cells[3,0] := '补助类型';
//    sgPhone.Cells[3,0] := '错误说明';
  end;
end;

procedure TFrm_main.BitBtn2Click(Sender: TObject);
var
i: integer;
begin

for i:=1 to stringgrid2.RowCount-1 do
begin
stringgrid2.Rows[i].Clear;
end;
ExcelToDB_1;
stringgrid2.Cells[0,0] := '员工编号';
stringgrid2.Cells[1,0] := '姓名';
stringgrid2.Cells[2,0] := '考勤日期';
stringgrid2.Cells[3,0] := '正班';
stringgrid2.Cells[4,0] := '加班';
stringgrid2.Cells[5,0] := '迟到';
stringgrid2.Cells[6,0] := '早退';
stringgrid2.Cells[7,0] := '旷工';
stringgrid2.Cells[8,0] := '序号';
stringgrid2.Cells[9,0] := '考勤编号';
stringgrid2.Cells[10,0] := '数值校验';
stringgrid2.Cells[11,0] := '锁';
label14.Caption := inttostr(stringgrid2.RowCount-1);
stringgrid2.Refresh;
if stringgrid2.RowCount-1>1 then
bitbtn3.Enabled := true;
bitbtn4.Enabled := false;

end;

procedure TFrm_main.BitBtn3Click(Sender: TObject);
var itmp,i,row,k: integer;
e: Extended;
f :TDateTime;
begin
  progressbar2.Visible := true;
   bitbtn2.Enabled := false;
   bitbtn3.Enabled := false;
   bitbtn4.Enabled := false;
    k:= strtoint(RightStr(DateToStr(EndOfTheMonth(strToDate(combobox1.Text+'-01'))),2));
    itmp := 1;
    dm.ADOQuery1.SQL.Clear;
    dm.ADOQuery1.SQL.Text := 'create table #onoffdutydata(rkey int,checkdate datetime,'+
      'employeeid int,employeecode nvarchar(20),chinesename nvarchar(20),'+
      'rwt float,rot float,sumct int,sumzt int,sumkt int,id int,locked int)';
    dm.ADOQuery1.ExecSQL;
     try
          for row:=1 to  stringgrid2.RowCount-1 do
            begin
            if (
               TryStrTodate(stringgrid2.Cells[2,row],f) and
               TryStrToFloat(stringgrid2.Cells[3,row],e) and
               TryStrToFloat(stringgrid2.Cells[4,row],e) and
               TryStrToFloat(stringgrid2.Cells[5,row],e) and
               TryStrToFloat(stringgrid2.Cells[6,row],e) and
               TryStrToFloat(stringgrid2.Cells[7,row],e)
               )
            then
               begin
                stringgrid2.Cells[10,row]:='OK';
                dm.ADOQuery1.SQL.Clear;
                dm.ADOQuery1.SQL.Text := 'insert into #onoffdutydata '+
                  '  select  0,'+#39+stringgrid2.Cells[2,row]+#39+','+ //RKEY,CHECKDATE
                  '0'+','+ //    ,EMPLOYEEID,
                  #39+stringgrid2.Cells[0,row]+#39+','+#39+stringgrid2.Cells[1,row]+#39+','+ //EMPLOYEECODE  ,chinesename
                  #39+stringgrid2.Cells[3,row]+#39+','+#39+stringgrid2.Cells[4,row]+#39+ ','+
                  #39+stringgrid2.Cells[5,row]+#39+','+#39+stringgrid2.Cells[6,row]+#39+ ','+
                  #39+stringgrid2.Cells[7,row]+#39+','+stringgrid2.Cells[8,row]+',0 ' ;
                dm.ADOQuery1.ExecSQL;
               end
               else
               begin
                stringgrid2.Cells[10,row]:='ERROR';
               end;
              itmp := itmp+1;
              progressbar2.Position := Trunc(itmp/(stringgrid2.RowCount)*90);
              application.ProcessMessages;
            end;
      dm.ADOQuery3.ExecSQL;
     finally
      i := 0 ;
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text := 'select * from #onoffdutydata order by id';
      dm.ADOQuery1.Open;

      while not dm.ADOQuery1.Eof do
      begin
        i := dm.ADOQuery1.FieldValues['id'];
        stringgrid2.Cells[9,i] := inttostr(dm.ADOQuery1.FieldValues['rkey']);
        stringgrid2.Cells[11,i] := inttostr(dm.ADOQuery1.FieldValues['locked']);
        dm.ADOQuery1.Next;
      end;
      dm.ADOQuery1.Close;
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text := 'drop table #onoffdutydata';
      dm.ADOQuery1.ExecSQL;
      bitbtn2.Enabled := true;
      bitbtn4.Enabled := true;
      stringgrid2.ColWidths[11] := 30;
      progressbar2.Position := 100 ;
      application.ProcessMessages;
      showmessage('检查完毕');
      stringgrid2.Refresh;
      progressbar2.Position :=0;
      progressbar2.Visible := false;
    end;
end;

procedure TFrm_main.BitBtn5Click(Sender: TObject);
begin
Export_Grid_to_Excel(stringgrid2,'导入结果') ;
end;

procedure TFrm_main.BitBtn4Click(Sender: TObject);
var itmp,i,row,k: integer;
begin
  k := 0 ;
  for i:=1 to stringgrid2.RowCount-1 do
  begin
     stringgrid2.Row := i;

     if   stringgrid2.Cells[9,i]<>'' then
       begin

         if ((k = 0) and (stringgrid2.Cells[11,i]='1')) then
         begin
            if Messagedlg('加过锁的记录确定要重新更新吗?',
             mtWarning,[mbYES,mbNO],0)=6 then
            begin
              k := 1 ;
            end
            else
            begin
              continue;
            end;
         end;
         dm.ADOQuery1.SQL.Clear;
         dm.ADOQuery1.SQL.Text :=  ' update onoffdutydata  '+
         ' set rwt='+stringgrid2.Cells[3,i]+',rot='+stringgrid2.Cells[4,i]+
         ' ,ct1=0,ct2=0,ct3=0,zt1=0,zt2=0,zt3=0 '+
         ',sumct='+stringgrid2.Cells[5,i]+',sumzt='+stringgrid2.Cells[6,i]+
         ',sumkt='+stringgrid2.Cells[7,i]+',locked=1,resttype=0'+
         ',ytnote= '+#39+'修改工时'+'('+oper_name+')'+#39+
         ' from onoffdutydata where rkey='+stringgrid2.Cells[9,i]  ;
         dm.ADOQuery1.ExecSQL;
         if stringgrid2.Cells[11,i]='1'
         then  stringgrid2.Cells[11,i] := '已锁重复更新'
         else stringgrid2.Cells[11,i] := '已更新';
       end;
     application.ProcessMessages;
     BitBtn4.Enabled := false;
  end;
  if ((i<>0) and (stringgrid2.Cells[1,2]<>''))  then
  begin
  showmessage('更新完毕');
  end;
end;

procedure TFrm_main.ComboBox2Change(Sender: TObject);
begin
edit1.Text:=program_ini.ReadString('服务器',combobox2.Text,'');
Label_db.Caption := program_ini.ReadString('数据库',combobox2.Text,'');
label_con3.Caption :='['+edit1.Text+'].'+label_db.Caption+'.dbo.';
label_emprkeyb.Caption := '0';
label29.Caption := '';
label28.Caption :='';
label_emprkeyb.Caption :='0';
label28.Font.Color := clBtnFace;
bitbtn7.Enabled := false;
bitbtn9.Enabled := false;
bitbtn8.Enabled := false;
if dm.ADOQuery4.Active then dm.ADOQuery4.Close;
end;

procedure TFrm_main.BitBtn7Click(Sender: TObject);
var i: integer;
begin
if label_emprkeyb.Caption ='0' then exit;
bitbtn7.Enabled := false;
if dm.ADOQuery4.Active then dm.ADOQuery4.Close;
 dm.ADOQuery4.Parameters.ParamValues['tablea']:=label_con3.Caption+'onoffdutydata';
 dm.ADOQuery4.Parameters.ParamValues['tableb']:=label_con3.Caption+'v_employeemsg';
 dm.ADOQuery4.Parameters.ParamValues['emprkeyb']:=label_emprkeyb.Caption;
 dm.ADOQuery4.Parameters.ParamValues['tpk1']:=FormatDateTime('yyyy-MM-DD',datetimepicker1.Date);
 dm.ADOQuery4.Parameters.ParamValues['tpk2']:=FormatDateTime('yyyy-MM-DD',datetimepicker2.Date);
 try
  //  showmessage(dm.ADOQuery4.Parameters.ParamValues['tablea']);
  //  showmessage(dm.ADOQuery4.Parameters.ParamValues['tableb']);
  //  showmessage(dm.ADOQuery4.Parameters.ParamValues['emprkeyb']);
  //    showmessage(dm.ADOQuery4.Parameters.ParamValues['tpk1']);
  //  showmessage(dm.ADOQuery4.Parameters.ParamValues['tpk2']);
  //    showmessage(dm.ADOQuery4.SQL.Text);
  dm.ADOQuery4.ExecSQL;
  dm.ADOQuery4.Open;
  bitbtn9.Enabled := true;
  bitbtn8.Enabled := true;
  dbgrideh1.Canvas.Refresh;
 except
  showmessage('出错');
 end;
 bitbtn7.Enabled := true;   
end;

procedure TFrm_main.BitBtn6Click(Sender: TObject);
var
InputVar: PDlgInput ;
begin
    bitbtn7.Enabled := false;
    bitbtn9.Enabled := false;
    bitbtn8.Enabled := false;
    edit2.Tag:= 0;
    label_emprkeya.Caption := '0';
    label29.Caption := '';
    label28.Caption :='';
    label35.Caption :='';
    label_emprkeyb.Caption :='0';
    label28.Font.Color := clBtnFace;
    frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
    InputVar.Fields := 'employeecode/工号/100,chinesename/姓名/100,departmentname/部门/100';
    InputVar.Sqlstr :=
    'select rkey,departmentname,employeecode,chinesename,idcard,'+
    ' substring(convert(nvarchar(20),ondutytime,120),1,10) as ondutytime  '+
    ' from v_employeemsg where status=1'+
    ' or outdutytime between dateadd(month,-2,getdate()) and getdate() '    ;
    try
        if dm.ADOQuery4.Active then dm.ADOQuery4.Close;
        inputvar.KeyField :='rkey';
        InputVar.AdoConn := dm.ADOConnection1;
        frmPick_Item_Single.InitForm_New(InputVar);
        if frmPick_Item_Single.ShowModal=mrok then
        begin
            edit2.Text := trim(frmPick_Item_Single.adsPick.FieldValues['employeecode']);
            edit2.Tag:=strtoint(trim(frmPick_Item_Single.adsPick.FieldValues['rkey']));
            label_emprkeya.Caption:=trim(frmPick_Item_Single.adsPick.FieldValues['rkey']);
            label26.Caption := trim(frmPick_Item_Single.adsPick.FieldValues['ondutytime']);
            label34.Caption := trim(frmPick_Item_Single.adsPick.FieldValues['idcard']);
            label31.Caption := trim(frmPick_Item_Single.adsPick.FieldValues['chinesename']);
            label_con3.Caption :='['+edit1.Text+'].'+label_db.Caption+'.dbo.';
        end;
    finally
        frmPick_Item_Single.adsPick.Close;
        frmPick_Item_Single.Free ;
    end;
    if edit2.Tag<> 0   then
    begin
      dm.ADOQuery1.SQL.Text :=' select top 1 rkey,departmentname,employeecode,chinesename,'+
        ' substring(convert(nvarchar(20),ondutytime,120),1,10) as ondutytime '+
        ' from '+'['+edit1.Text+'].'+label_db.Caption+'.dbo.v_employeemsg where '+
        ' ( status=1 or outdutytime between dateadd(month,-2,getdate()) and getdate() ) and idcard='
         +#39+ label34.Caption+#39;
      //showmessage(dm.ADOQuery1.SQL.Text);
      try
        dm.ADOQuery1.Open;
        if not dm.ADOQuery1.IsEmpty then
          begin
            label29.Caption :=  trim(dm.ADOQuery1.FieldValues['employeecode']);
            label28.Caption :=  trim(dm.ADOQuery1.FieldValues['chinesename']);
            label35.Caption :=  trim(dm.ADOQuery1.FieldValues['ondutytime']);
            label_emprkeyb.Caption :=  trim(inttostr(dm.ADOQuery1.FieldValues['rkey']));
            label28.Font.Color := clred;
            bitbtn7.Enabled := true;            
          end
          else
          begin
            showmessage(edit1.Text+'查找员工失败');
            label_emprkeyb.Caption := '0';
            label29.Caption := '';
            label28.Caption :='';
            label35.Caption :='';
            label_emprkeyb.Caption :='';
            label28.Font.Color := clBtnFace;
          end;
        dm.ADOQuery1.Close;
      except
         showmessage('查找员工失败');
         label_emprkeyb.Caption := '0';
         label29.Caption := '';
         label28.Caption :='';
         label35.Caption :='';
         label_emprkeyb.Caption :='';
         label28.Font.Color := clBtnFace;;
      end;
    dm.ADOQuery1.SQL.Clear;
    end;
end;


procedure TFrm_main.BitBtn8Click(Sender: TObject);
var
str_oper : string;
begin
  //oper_name
  if dm.ADOQuery4.IsEmpty then
  begin
    showmessage('没有提供可复制的考勤');
    exit;
  end;
  if label31.Caption<>label28.Caption then
  begin
    showmessage('名字不相符');
    exit;
  end;
  //showmessage(oper_name);
  str_oper:=('考勤复制('+oper_name+')');
  //showmessage(str_oper);
  bitbtn8.Enabled := false;
    try
      dm.ADOQuery4_copy.Parameters.ParamValues['tablea']:=label_con3.Caption+'onoffdutydata';
      dm.ADOQuery4_copy.Parameters.ParamValues['tableb']:=label_con3.Caption+'v_employeemsg';
      dm.ADOQuery4_copy.Parameters.ParamValues['emprkeya']:=label_emprkeya.Caption;
      dm.ADOQuery4_copy.Parameters.ParamValues['emprkeyb']:=label_emprkeyb.Caption;
      dm.ADOQuery4_copy.Parameters.ParamValues['tpk1']:=FormatDateTime('yyyy-MM-DD',datetimepicker1.Date);
      dm.ADOQuery4_copy.Parameters.ParamValues['tpk2']:=FormatDateTime('yyyy-MM-DD',datetimepicker2.Date);
      dm.ADOQuery4_copy.Parameters.ParamValues['ytnote']:=str_oper;
      dm.ADOQuery4_copy.ExecSQL;
      application.ProcessMessages;
      showmessage('复制成功');
    except
      showmessage('复制失败');
    end;
  bitbtn8.Enabled := true;
end;

procedure TFrm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
  //showmessage('开始画图');
  if   (Column.FieldName= 'resttype')   and
  (DbGridEh1.DataSource.DataSet.FieldByName( 'resttype').AsString= '1')   then
      DbGridEh1.Canvas.Brush.color:=clGreen;
  if   (Column.FieldName= 'resttype')   and
  (DbGridEh1.DataSource.DataSet.FieldByName( 'resttype').AsString= '2')   then
      DbGridEh1.Canvas.Brush.color:=clYellow;
  if   (Column.FieldName= 'resttype')   and
  (DbGridEh1.DataSource.DataSet.FieldByName( 'resttype').AsString= '3')   then
      DbGridEh1.Canvas.Brush.color:=clAqua;
      if   (Column.FieldName= 'resttype')   and
  (DbGridEh1.DataSource.DataSet.FieldByName( 'resttype').AsString= '4')   then
      DbGridEh1.Canvas.Brush.color:=clMaroon;
{1	周末加班	clGreen
2	调休	clYellow
3	法定节假日	clAqua
4	全天休息	clMaroon} 
  DbGridEh1.DefaultDrawColumnCell (Rect,DataCol,Column,State);
end;

procedure TFrm_main.BitBtn9Click(Sender: TObject);
begin
  BitBtn9.Enabled := false;
  BitBtn8.Enabled := false;
  try
  if dm.ADOQuery4.Active then
  begin
    dm.ADOQuery4.Close;
    dm.ADOQuery4.Parameters.ParamValues['tablea']:=label_con3.Caption+'onoffdutydata';
    dm.ADOQuery4.Parameters.ParamValues['tableb']:=label_con3.Caption+'v_employeemsg';
    dm.ADOQuery4.Parameters.ParamValues['emprkeyb']:=label_emprkeyb.Caption;
    dm.ADOQuery4.Parameters.ParamValues['tpk1']:=FormatDateTime('yyyy-MM-DD',datetimepicker1.Date);
    dm.ADOQuery4.Parameters.ParamValues['tpk2']:=FormatDateTime('yyyy-MM-DD',datetimepicker2.Date);
    dm.ADOQuery4.open;
    BitBtn8.Enabled := true;
  end;
  except
    showmessage('刷新失败');
    BitBtn8.Enabled := false;
  end;
  BitBtn9.Enabled := true;
 
end;

procedure TFrm_main.BitBtn10Click(Sender: TObject);
var
i: integer;
begin
for i:=1 to stringgrid5.RowCount-1 do
begin
stringgrid5.Rows[i].Clear;
end;
ExcelToDB_5;
stringgrid5.Cells[0,0] := '员工工号';
stringgrid5.Cells[1,0] := '姓名';
stringgrid5.Cells[2,0] := '岗位';
stringgrid5.Cells[3,0] := '籍贯';
stringgrid5.Cells[4,0] := '岗位校验';
stringgrid5.Cells[5,0] := '籍贯校验';
stringgrid5.Cells[6,0] := '员工校验';
stringgrid5.Cells[7,0] := '数值校验'; //0两个都不能更新，1只可以更新岗位，2只可以更新籍贯，3 两个都可以更新
stringgrid5.Cells[8,0] := '序号';
stringgrid5.Cells[9,0] := '更新结果';
label41.Caption := inttostr(stringgrid5.RowCount-1);
stringgrid5.Refresh;
if stringgrid5.RowCount-1>1 then
bitbtn11.Enabled := true;
bitbtn12.Enabled := false; 
end;


procedure TFrm_main.BitBtn11Click(Sender: TObject);
var itmp,i,row,k: integer;
e: Extended;
f :TDateTime;
begin
   progressbar2.Visible := true;
   bitbtn10.Enabled := false;
   bitbtn11.Enabled := false;
   bitbtn12.Enabled := false;
   bitbtn13.Enabled := false;
    k:= strtoint(RightStr(DateToStr(EndOfTheMonth(strToDate(combobox1.Text+'-01'))),2));
    itmp := 1;
    dm.ADOQuery1.SQL.Clear;
    dm.ADOQuery1.SQL.Text := 'create table #employee_station('+
      'employeeid int,employeecode nvarchar(20),chinesename nvarchar(20),'+
      'str_station nvarchar(20),ptr_station int,str_province nvarchar(20),'+
	  'check_province int, result_check int,data_index int)';
    dm.ADOQuery1.ExecSQL;

     try
          for row:=1 to  stringgrid5.RowCount-1 do
            begin
              dm.ADOQuery1.SQL.Clear;
              dm.ADOQuery1.SQL.Text := 'insert into #employee_station '+
                '  select  0,'+
                #39+stringgrid5.Cells[0,row]+#39+','+#39+stringgrid5.Cells[1,row]+#39+','+ //EMPLOYEECODE  ,chinesename
                #39+stringgrid5.Cells[2,row]+#39+',0,'
                +#39+stringgrid5.Cells[3,row]+#39+ ',0,0,'+stringgrid5.Cells[8,row] ;
              dm.ADOQuery1.ExecSQL;
              itmp := itmp+1;
              progressbar2.Position := Trunc(itmp/(stringgrid5.RowCount)*90);
              application.ProcessMessages;
            end;
         dm.ADOQuery5.ExecSQL; //检查校验列赋值
     finally
      i := 0 ;
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text := 'select * from #employee_station order by data_index';
      dm.ADOQuery1.Open;

      while not dm.ADOQuery1.Eof do
      begin
        i := dm.ADOQuery1.FieldValues['data_index'];
        stringgrid5.Cells[6,i] := inttostr(dm.ADOQuery1.FieldValues['employeeid']);
        stringgrid5.Cells[4,i] := inttostr(dm.ADOQuery1.FieldValues['ptr_station']);
        stringgrid5.Cells[7,i] := inttostr(dm.ADOQuery1.FieldValues['result_check']);
        stringgrid5.Cells[5,i] := inttostr(dm.ADOQuery1.FieldValues['check_province']);
        case  strtoint(stringgrid5.Cells[7,i])  of
        0 :  stringgrid5.Cells[9,i] := '未更新,岗位和籍贯都不可更新';
        1 :  stringgrid5.Cells[9,i] := '未更新,可更新岗位';
        2 :  stringgrid5.Cells[9,i] := '未更新,可更新籍贯';
        3 :  stringgrid5.Cells[9,i] := '未更新,岗位和籍贯都可更新';
        end;
        dm.ADOQuery1.Next;
      end;
      dm.ADOQuery1.Close;
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text := 'drop table #employee_station';
      dm.ADOQuery1.ExecSQL;
      bitbtn10.Enabled := true;
      bitbtn12.Enabled := true;
      progressbar2.Position := 100 ;
      application.ProcessMessages;
      showmessage('检查完毕');
      stringgrid5.Refresh;
      progressbar2.Position :=0;
      progressbar2.Visible := false;
    end;
end;

procedure TFrm_main.BitBtn12Click(Sender: TObject);
var itmp,i,row,k: integer;
begin

  for i:=1 to stringgrid5.RowCount-1 do
  begin
     stringgrid5.Row := i;

     if   stringgrid5.Cells[9,i]<>'未更新,岗位和籍贯都不可更新' then
       begin
         dm.ADOQuery1.SQL.Clear;

         if stringgrid5.Cells[9,i]='未更新,可更新岗位' then
         dm.ADOQuery1.SQL.Text :=  ' update employeemsg  '+
         ' set station='+stringgrid5.Cells[4,i]+
         ' from employeemsg where rkey='+stringgrid5.Cells[6,i]  ;

         if stringgrid5.Cells[9,i]='未更新,可更新籍贯' then
           dm.ADOQuery1.SQL.Text :=  ' update employeemsg  '+
         ' set province='+#39+stringgrid5.Cells[3,i]+#39+
         ' from employeemsg where rkey='+stringgrid5.Cells[6,i]  ;


          if stringgrid5.Cells[9,i]='未更新,岗位和籍贯都可更新' then
           dm.ADOQuery1.SQL.Text :=  ' update employeemsg  '+
         ' set station='+stringgrid5.Cells[4,i]+
         ',province='+#39+stringgrid5.Cells[3,i]+#39+
         ' from employeemsg where rkey='+stringgrid5.Cells[6,i]  ;

         try
            dm.ADOQuery1.ExecSQL;
            stringgrid5.Cells[9,i] := StringReplace(stringgrid5.Cells[9,i],'未','已', []);
            stringgrid5.Cells[9,i] := StringReplace(stringgrid5.Cells[9,i],'可','', []);
         except
            stringgrid5.Cells[9,i] := '更新失败';
         end;

       end;
     application.ProcessMessages;
     BitBtn12.Enabled := false;
  end;

  if ((i<>0) and (stringgrid5.Cells[1,2]<>''))  then
  begin
  showmessage('更新完毕');
  bitbtn13.Enabled := true;
  end;
  stringgrid5.Refresh;

end;

procedure TFrm_main.BitBtn13Click(Sender: TObject);
begin
Export_Grid_to_Excel(stringgrid5,'导入结果') ;
end;

procedure TFrm_main.btn1Click(Sender: TObject);
var i:Integer;
begin
for i:=1 to stringgrid3.RowCount-1 do
begin
stringgrid3.Rows[i].Clear;
end;
ExcelToDB_2;
lbl3.Caption := inttostr(stringgrid3.RowCount-1);
stringgrid3.Refresh;
if stringgrid3.RowCount-1>1 then
BitBtn14.Enabled := True;
end;

procedure TFrm_main.BitBtn14Click(Sender: TObject);
var itmp,i,row,k,j: integer;
e: Extended;
f :TDateTime;
str_oper : string;
tpk1,tpk2 :string;
begin

       if Messagedlg('确定记录从['+combobox2.Text+']搜集吗?',
             mtWarning,[mbYES,mbNO],0)=6 then
            begin
              k := 1 ;
            end
            else
            begin
              Exit;
            end;
    str_oper:=('考勤复制('+oper_name+')');
    //showmessage(oper_name);
    tpk1 := FormatDateTime('yyyy-MM-DD',datetimepicker1.Date);
    tpk2 := FormatDateTime('yyyy-MM-DD',datetimepicker2.Date);
    itmp := 1;
    try
    dm.ADOQuery1.SQL.Clear;
    dm.ADOQuery1.SQL.Text := 'if exists(select * from tempdb..sysobjects '+
    ' where id=object_id('+#39+'tempdb..#TEMP_employee'+#39+')) '+
    ' drop table #TEMP_employee '+
    ' create table #TEMP_employee('+
    ' n_rkey int,employeecode nvarchar(20),chinesename nvarchar(20),'+
    '  idcardno nvarchar(20),w_rkey int,w_employeecode nvarchar(20),'+
	  ' w_result_check int, n_result_check int,data_index int)';
     dm.ADOQuery1.ExecSQL;
     //showmessage('建表TEMP_employee');
     //showmessage(dm.ADOQuery1.SQL.Text);
          for row:=1 to  stringgrid3.RowCount-1 do
            begin
              dm.ADOQuery1.SQL.Clear;
              dm.ADOQuery1.SQL.Text := 'insert into #TEMP_employee '+
              '(n_rkey,w_rkey,w_result_check,n_result_check,employeecode,'+
              'chinesename,idcardno,data_index) '+
                '  select  0,0,0,0,'+
                #39+stringgrid3.Cells[0,row]+#39+','
                +#39+stringgrid3.Cells[1,row]+#39+','
                +#39+'0'+#39+','
                +stringgrid3.Cells[7,row] ;
              dm.ADOQuery1.ExecSQL;
              itmp := itmp+1;
              progressbar2.Position := Trunc(itmp/(stringgrid3.RowCount)*90);
              stxt1.Caption :='正在导入名单';
              application.ProcessMessages;
            end;
//     showmessage('插入TEMP_employee');
      progressbar2.Position := 100;
      application.ProcessMessages;
      progressbar2.Position := 0;
      stxt1.Caption :='开始本地匹配名单';
      application.ProcessMessages;
      DM.qry_checkperson.SQL.Clear;
       dm.qry_checkperson.SQL.Text:= 'update #TEMP_employee   '+
       ' set n_rkey=isnull(b.rkey,0),'+
       '  idcardno=isnull(b.idcard,'+#39+'0'+#39+')'+
       ' from #TEMP_employee a '+
       ' left join employeemsg b '+
       ' on a.employeecode=b.employeecode '+
       ' where a.employeecode in '+
       ' (select employeecode from employeemsg) ';
      DM.qry_checkperson.ExecSQL;
//     showmessage('匹配本地TEMP_employee');
//     showmessage(dm.qry_checkperson.SQL.Text);
      progressbar2.Position := 10;
      stxt1.Caption :='开始异地匹配名单' ;
      application.ProcessMessages;
      dm.qry_checkperson.SQL.Clear;
      DM.qry_checkperson.SQL.Text :=' update #TEMP_employee '+
      ' set w_rkey=isnull(b.rkey,0), '+
      ' w_employeecode=isnull(b.employeecode,'+#39+'0'+#39+')  '+
      ' from #TEMP_employee a '+
      ' left join '+
      ' ( select rkey,employeecode,idcard from '+
      label_con3.Caption+
      'employeemsg  where status=1 or outdutytime>=dateadd(month,-2,getdate())'+
      ' ) as b '+
      ' on a.idcardno=b.idcard '+
      ' where  a.idcardno<>'+#39+'0'+#39 ; //------
       dm.qry_checkperson.ExecSQL; //检查赋值
//      showmessage('匹配异地TEMP_employee');
//     showmessage(dm.qry_checkperson.SQL.Text);
       progressbar2.Position := 20;
       stxt1.Caption :='开始导入异地考勤';
       application.ProcessMessages;
      //开始复制
      dm.qry_checkperson.SQL.Clear;
      DM.qry_checkperson.SQL.Text :='if exists(select * from tempdb..sysobjects'+
      ' where id=object_id('+#39+'tempdb..#onoffdutydata_b'+#39+
      '))  drop table #onoffdutydata_b select * into #onoffdutydata_b  from '+
      label_con3.Caption+'onoffdutydata where checkdate between '+
      #39+tpk1+#39+' and '+#39+tpk2+#39+
      'and employeeid in (select w_rkey from #TEMP_employee where isnull(w_rkey,0)<>0) ';
//           showmessage('创建考勤虚表');
//     showmessage(dm.qry_checkperson.SQL.Text);
      dm.qry_checkperson.ExecSQL; //检查赋值
       progressbar2.Position :=80;
       stxt1.Caption :='开始复制考勤';
       application.ProcessMessages;
       //匹配结果
      dm.qry_checkperson.SQL.Clear;
      DM.qry_checkperson.SQL.Text :=' update #TEMP_employee '+
      ' set w_result_check=0  '+
      ' from #temp_employee   '+
      ' where not exists      '+
      ' (select rkey from  #onoffdutydata_b '+
      ' where employeeid=#temp_employee.w_rkey) ';
      dm.qry_checkperson.ExecSQL; //检查赋值
//       showmessage('整理考勤虚表1');
//     showmessage(dm.qry_checkperson.SQL.Text);
      //------------------------
      dm.qry_checkperson.SQL.Clear;
      DM.qry_checkperson.SQL.Text :=' update #TEMP_employee '+
      ' set w_result_check=1  '+
      ' from #temp_employee   '+
      ' where  exists      '+
      ' (select rkey from  #onoffdutydata_b '+
      ' where employeeid=#temp_employee.w_rkey) ';
      dm.qry_checkperson.ExecSQL; //检查赋值
//             showmessage('整理考勤虚表2');
//     showmessage(dm.qry_checkperson.SQL.Text);
//-------------------------------
     dm.qry_checkperson.SQL.Clear;
      DM.qry_checkperson.SQL.Text :=' update onoffdutydata '+
      ' set  ondutytime1=bb.ondutytime1, '+
      ' offdutytime1=bb.offdutytime1, '+
      ' ondutytime2=bb.ondutytime2,'+
      ' offdutytime2=bb.offdutytime2, '+
      ' ondutytime3=bb.ondutytime3, '+
      ' offdutytime3=bb.offdutytime3,'+
      ' rwt=bb.rwt,rot=bb.rot,sumct=bb.sumct,'+
      ' sumzt=bb.sumzt,sumkt=bb.sumkt,'+
      ' RestType = bb.RestType,'+
      ' locked=1,ytnote=bb.ytnote+'+#39+str_oper+#39+
      ' from onoffdutydata aa join #TEMP_employee b on aa.employeeid=b.n_rkey '+
      ' join #onoffdutydata_b bb on bb.employeeid =b.w_rkey'+
      ' and aa.checkdate=bb.checkdate'+
      ' where aa.employeeid in (select n_rkey from #TEMP_employee)'+
      ' and aa.checkdate between '+#39+tpk1+#39+' and '+#39+tpk2+#39;
      stxt1.Caption :='复制考勤结束...';
      application.ProcessMessages;
      dm.qry_checkperson.ExecSQL; //检查赋值
//      showmessage('复制考勤虚表2');
//     showmessage(dm.qry_checkperson.SQL.Text);
       progressbar2.Position := 90;
       stxt1.Caption :='开始返回操作结果...';
       application.ProcessMessages;
     finally
      i := 0 ;
      j := 0 ;
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text := 'select * from #TEMP_employee order by data_index';
      dm.ADOQuery1.Open;

      while not dm.ADOQuery1.Eof do
      begin
        i := dm.ADOQuery1.FieldValues['data_index'];
        if not dm.ADOQuery1.FieldByName('n_rkey').IsNull then
        stringgrid3.Cells[2,i] := inttostr(dm.ADOQuery1.FieldValues['n_rkey']);
        if not dm.ADOQuery1.FieldByName('idcardno').IsNull then
        stringgrid3.Cells[3,i] :=dm.ADOQuery1.FieldValues['idcardno'];
        if not dm.ADOQuery1.FieldByName('w_employeecode').IsNull then
        stringgrid3.Cells[4,i] := dm.ADOQuery1.FieldValues['w_employeecode'];
        if not dm.ADOQuery1.FieldByName('w_rkey').IsNull then
        stringgrid3.Cells[5,i] := inttostr(dm.ADOQuery1.FieldValues['w_rkey']);
        if not dm.ADOQuery1.FieldByName('w_result_check').IsNull then
        if dm.ADOQuery1.FieldValues['w_rkey']=0 then
         stringgrid3.Cells[6,i] := 'error'
         else  stringgrid3.Cells[6,i] := 'OK';
        if DM.ADOQuery1.FieldValues['w_rkey'] * DM.ADOQuery1.FieldValues['n_rkey'] >0 then
        j:=j+1;
        dm.ADOQuery1.Next;
      end;
      dm.ADOQuery1.Close;
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text := 'drop table #TEMP_employee';
      dm.ADOQuery1.ExecSQL;
      bitbtn10.Enabled := true;
      bitbtn12.Enabled := true;
      progressbar2.Position := 100 ;
      stxt1.Caption :='';
      lbl4.Caption := IntToStr(j);
      application.ProcessMessages;
      showmessage('处理完毕');
      stringgrid3.Refresh;
      progressbar2.Position :=0;
      progressbar2.Visible := false;
      application.ProcessMessages;
    end;
end;


    


procedure TFrm_main.btn2Click(Sender: TObject);
begin
Export_Grid_to_Excel(stringgrid3,'导入结果') ;
end;

procedure TFrm_main.BitBtn15Click(Sender: TObject);
var
i: integer;
begin
for i:=1 to stringgrid6.RowCount-1 do
begin
  stringgrid6.Rows[i].Clear;
end;
  ExcelToDB_6;
  stringgrid6.Cells[0,0] := '员工工号';
  stringgrid6.Cells[1,0] := '姓名';
  stringgrid6.Cells[2,0] := '社保帐号';
  stringgrid6.Cells[3,0] := '公积金帐号';
  stringgrid6.Cells[4,0] := '社保校验';
  stringgrid6.Cells[5,0] := '公积金校验';
  stringgrid6.Cells[6,0] := '员工校验';
  stringgrid6.Cells[7,0] := '数值校验'; //0两个都不能更新，1只可以更新岗位，2只可以更新籍贯，3 两个都可以更新
  stringgrid6.Cells[8,0] := '序号';
  stringgrid6.Cells[9,0] := '更新结果';
  label48.Caption := inttostr(stringgrid6.RowCount-1);
  stringgrid6.Refresh;
  if stringgrid6.RowCount-1>1 then
  bitbtn16.Enabled := true;
  bitbtn17.Enabled := false;
end;

procedure TFrm_main.BitBtn16Click(Sender: TObject);
var itmp,i,row,k: integer;
e: Extended;
f :TDateTime;
begin
   progressbar2.Visible := true;
   bitbtn15.Enabled := false;
   bitbtn16.Enabled := false;
   bitbtn17.Enabled := false;
   bitbtn18.Enabled := false;
   k:= strtoint(RightStr(DateToStr(EndOfTheMonth(strToDate(combobox1.Text+'-01'))),2));
   itmp := 1;
    dm.ADOQuery1.SQL.Clear;
    dm.ADOQuery1.SQL.Text := 'create table #employee_account('+
      'employeeid int,employeecode nvarchar(20),chinesename nvarchar(20),'+
      'str_sbaccount nvarchar(20),ptr_sbaccount int,str_gjjaccount nvarchar(20),'+
	  'check_gjjaccount int, result_check int,data_index int)';
    dm.ADOQuery1.ExecSQL;

     try
          for row:=1 to  stringgrid6.RowCount-1 do
            begin
              dm.ADOQuery1.SQL.Clear;
              dm.ADOQuery1.SQL.Text := 'insert into #employee_account '+
                '  select  0,'+
                #39+stringgrid6.Cells[0,row]+#39+','+#39+stringgrid6.Cells[1,row]+#39+','+ //EMPLOYEECODE  ,chinesename
                #39+stringgrid6.Cells[2,row]+#39+',0,'
                +#39+stringgrid6.Cells[3,row]+#39+ ',0,0,'+stringgrid6.Cells[8,row] ;
              dm.ADOQuery1.ExecSQL;
              itmp := itmp+1;
              progressbar2.Position := Trunc(itmp/(stringgrid6.RowCount)*90);
              application.ProcessMessages;
            end;
         dm.ADOQuery6.ExecSQL; //检查校验列赋值
     finally
      i := 0 ;
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text := 'select * from #employee_account order by data_index';
      dm.ADOQuery1.Open;

      while not dm.ADOQuery1.Eof do
      begin
        i := dm.ADOQuery1.FieldValues['data_index'];
        stringgrid6.Cells[6,i] := inttostr(dm.ADOQuery1.FieldValues['employeeid']);
        stringgrid6.Cells[4,i] := inttostr(dm.ADOQuery1.FieldValues['ptr_sbaccount']);
        stringgrid6.Cells[7,i] := inttostr(dm.ADOQuery1.FieldValues['result_check']);
        stringgrid6.Cells[5,i] := inttostr(dm.ADOQuery1.FieldValues['check_gjjaccount']);
        case  strtoint(stringgrid6.Cells[7,i])  of
        0 :  stringgrid6.Cells[9,i] := '未更新,社保和公积金都不可更新';
        1 :  stringgrid6.Cells[9,i] := '未更新,可更新社保';
        2 :  stringgrid6.Cells[9,i] := '未更新,可更新公积金';
        3 :  stringgrid6.Cells[9,i] := '未更新,社保和公积金都可更新';
        end;
        dm.ADOQuery1.Next;
      end;
      dm.ADOQuery1.Close;
      dm.ADOQuery1.SQL.Clear;
      dm.ADOQuery1.SQL.Text := 'drop table #employee_account';
      dm.ADOQuery1.ExecSQL;
      bitbtn15.Enabled := true;
      bitbtn17.Enabled := true;
      progressbar2.Position := 100 ;
      application.ProcessMessages;
      showmessage('检查完毕');
      stringgrid6.Refresh;
      progressbar2.Position :=0;
      progressbar2.Visible := false;
    end;
end;


procedure TFrm_main.BitBtn17Click(Sender: TObject);
var itmp,i,row,k: integer;
begin

  for i:=1 to stringgrid6.RowCount-1 do
  begin
     stringgrid6.Row := i;

     if   stringgrid6.Cells[9,i]<>'未更新,社保和公积金都不可更新' then
       begin
         dm.ADOQuery1.SQL.Clear;
         if stringgrid6.Cells[9,i]='未更新,可更新社保' then
         dm.ADOQuery1.SQL.Text :=  ' update employeemsg  '+
         ' set siaccountno='+#39+stringgrid6.Cells[2,i]+#39+
         ' from employeemsg where rkey='+stringgrid6.Cells[6,i]  ;

         if stringgrid6.Cells[9,i]='未更新,可更新公积金' then
           dm.ADOQuery1.SQL.Text :=  ' update employeemsg  '+
         ' set public_accumulation_funds='+#39+stringgrid6.Cells[3,i]+#39+
         ' from employeemsg where rkey='+stringgrid6.Cells[6,i]  ;


          if stringgrid6.Cells[9,i]='未更新,社保和公积金都可更新' then
           dm.ADOQuery1.SQL.Text :=  ' update employeemsg  '+
         ' set siaccountno='+#39+stringgrid6.Cells[2,i]+#39+
         ',public_accumulation_funds='+#39+stringgrid6.Cells[3,i]+#39+
         ' from employeemsg where rkey='+stringgrid6.Cells[6,i]  ;
         try
            dm.ADOQuery1.ExecSQL;
            stringgrid6.Cells[9,i] := StringReplace(stringgrid6.Cells[9,i],'未','已', []);
            stringgrid6.Cells[9,i] := StringReplace(stringgrid6.Cells[9,i],'可','', []);
         except
            stringgrid6.Cells[9,i] := '更新失败';
         end;

       end;
     application.ProcessMessages;
     BitBtn12.Enabled := false;
  end;

  if ((i<>0) and (stringgrid6.Cells[1,2]<>''))  then
  begin
  showmessage('更新完毕');
  bitbtn18.Enabled := true;
  end;
  stringgrid6.Refresh;

end;

procedure TFrm_main.BitBtn18Click(Sender: TObject);
begin
  Export_Grid_to_Excel(stringgrid6,'导入结果') ;
end;

procedure TFrm_main.btn3Click(Sender: TObject);
begin

  try
    btn3.Enabled := False;
    lbl5.Caption := '查询中...请稍后';
    Application.ProcessMessages;
    qry1.SQL.Clear;
    qry1.SQL.Text := ' select departmentname as 部门,employeecode as 工号,'+
                  ' chinesename as 姓名,position_item as 职务,case when wagetype=9 then '+#39+'日薪'+#39+
                  ' else '+#39+'月薪'+#39+'end  as   帐套, dbo.Get_7daysnotrest(rkey,'+ #39+
                  FormatDateTime('yyyy-MM-dd',dtp1.Date)+ #39+','+ #39+
                  FormatDateTime('yyyy-MM-dd',dtp2.Date)+ #39+' ) as 标识   '+
                  'from v_employeemsg  ' +
                  ' where rkey in (select distinct employeeid from onoffdutydata '+
                  ' where checkdate between '+#39+ FormatDateTime('yyyy-MM-dd',dtp1.Date)+ #39+' and '+ #39+
                  FormatDateTime('yyyy-MM-dd',dtp2.Date)+ #39+' )'+
                  ' and departmentid in ( select departmentid from hr_permission  ' +
                  ' where operator_ptr='+rkey73
                  +' and program_ptr=(select top 1 rkey from data0419 where programe='+quotedstr('kqtj.exe')+'))';
    //     ShowMessage(qry1.SQL.Text);
    qry1.ExecSQL;
    qry1.Open;
    qry1.Filter := '标识=1';
    lbl5.Caption := IntToStr(qry1.RecordCount);
    
   finally
     btn3.Enabled := true;

    
  end;
end;

procedure TFrm_main.BitBtn19Click(Sender: TObject);
begin
   Export_dbGridEH_to_Excel(dbgrdh1,'连续上班超长查询结果');
end;

procedure TFrm_main.BitBtn23Click(Sender: TObject);
var
  i,iCol,iRow,n,t: integer;
  excel:Variant;
begin
  for i:=1 to sgPhone.RowCount-1 do
  begin
    sgPhone.Rows[i].Clear;
  end;
  sgPhone.RowCount:=2;
  iCol:=1;
  iRow:=2;
  t:=1;

  ProgressBar2.Position:=0;
  OpenDialog1.Title:='请选择要导入的文件';
  OpenDialog1.Filter:='*.xls|*.xls';
  OpenDialog1.DefaultExt:='xls';

  if OpenDialog1.Execute then
  begin
//    btnImport.Enabled:=False;
    Application.ProcessMessages;
    Screen.Cursor:=crHourGlass;
    excel:=CreateOleObject('Excel.Application');
    excel.visible:=False;
    excel.WorkBooks.open(OpenDialog1.FileName);
    n:= Round(excel.activesheet.UsedRange.Rows.Count/10);
    for i:=2 to excel.activesheet.UsedRange.Rows.Count do
    begin
      with sgPhone do
      begin
        Cells[0,i-1]:=Trim(excel.activesheet.cells[iRow,iCol].value);
        Cells[1,i-1]:=Trim(excel.activesheet.cells[iRow,iCol+1].value);
        Cells[2,i-1]:=Trim(excel.activesheet.cells[iRow,iCol+2].value);
        iRow:=iRow+1;
        RowCount:=RowCount+1;
        if i=n*t then
        begin
          ProgressBar2.Position:=10*t;
          Application.ProcessMessages;
          t:=t+1;
        end;
      end;
    end;
    excel.quit;
    ProgressBar2.Position:=100;
    Screen.Cursor:=crDefault;
    ShowMessage('导入完成');
    BitBtn22.Enabled:=True;
  end;

end;

procedure TFrm_main.BitBtn22Click(Sender: TObject);
var
  i:Integer;
begin
  try
    with qry1 do
    begin
      Close;
      SQL.Clear;
      SQL.Add('if exists(select * from tempdb.dbo.sysobjects where id = object_id(N''tempdb..#phone_235'') and type=''U'') '+ #13+
              'drop table #phone_235 '+#13+
              'create table #phone_235(employeeid int,empno nvarchar(20),empname nvarchar(10),phone nvarchar(20),col int)' );
      ExecSQL;

      Close;
      SQL.Clear;
      for i:=1 to sgPhone.RowCount-2 do
      begin
        SQL.Text:=SQL.Text+ 'insert into #phone_235 values(0,'+ QuotedStr(sgPhone.Cells[0,i])+ ','+  QuotedStr(sgPhone.Cells[1,i])
                    +','+ QuotedStr(sgPhone.Cells[2,i]) +','+ IntToStr(i)+')'+#13;
      end;
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Text:='update #phone_235 set employeeid = employeemsg.rkey' + #13+
                'from #phone_235 inner join employeemsg on #phone_235.empno=employeemsg.employeecode and #phone_235.empname=employeemsg.chinesename ';
      ExecSQL;

      Close;
      SQL.Clear;
      SQL.Text:='select employeeid,col from #phone_235 where employeeid=0';
      Open;
      if not IsEmpty then
      begin
        First;
        while not Eof do
        begin
          sgPhone.Cells[4,FieldByName('col').AsInteger]:='工号或姓名有误，不会导入';
        end;
      end;
    end;
    ShowMessage('检查完成');
    BitBtn20.Enabled:=True;
    BitBtn21.Enabled:=True;
  except
    on E: Exception do
    begin
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TFrm_main.BitBtn21Click(Sender: TObject);
begin
  if MessageDlg('更新只针对无误数据，确定导入吗？',mtWarning,[mbYes,mbNo],0)=mrno then Exit;
  try
    with qry1 do
    begin
        Close;
        SQL.Clear;
        SQL.Text:='update employeemsg set phone=#phone_235.phone '+
                  ' from #phone_235 inner join employeemsg on #phone_235.employeeid=employeemsg.rkey';
        ExecSQL;
    end;
    ShowMessage('更新成功');
  except
    on E: Exception do
    begin
      messagedlg(E.Message,mterror,[mbcancel],0);
    end;
  end;
end;

procedure TFrm_main.BitBtn20Click(Sender: TObject);
begin
  if sgPhone.RowCount>2 then
    Export_Grid_to_Excel(sgPhone,'导入结果',True) ;
end;

procedure TFrm_main.btn4Click(Sender: TObject);
var
  filename:string;
  i:Integer;
  iCount, jCount: Integer;
  XLApp: variant;
  Sheet: Variant;
begin
  if sgList.RowCount > 2 then
  for i:=1 to sglist.RowCount-1 do
  begin
    sglist.Rows[i].Clear;
  end;
  sglist.RowCount:=2;

//  ProgressBar2.Position:=0;
  OpenDialog1.Title:='请选择要导入的文件';
  OpenDialog1.Filter:='*.xls|*.xls';
  OpenDialog1.DefaultExt:='xls';
  if OpenDialog1.Execute then  fileName:=OpenDialog1.FileName else exit;
  Screen.Cursor := crHourGlass;
  if not VarIsEmpty(XLApp) then
   begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
   end;
    try
     XLApp := CreateOleObject('Excel.Application'); //创建OLE对象
    except
     Screen.Cursor := crDefault;
     Exit;
    end;
   try
     XLApp.workBooks.Open(fileName);
     Sheet := XLApp.Workbooks[1].WorkSheets[1];
     for iCount:=2 to 65535 do
      begin
        if trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) = '' then break;
         sglist.RowCount:=sglist.RowCount+1;
          for jCount:=1 to 12 do
           sglist.Cells[jCount-1,iCount-1]:=sheet.cells[iCount,jCount];
      end;
     XLApp.workbooks[1].close;
   finally
     XLApp.quit;
     Screen.Cursor := crDefault;
   end;
   btn5.Enabled:= true;
end;

procedure TFrm_main.btn5Click(Sender: TObject);
var itmp,i,row,k: integer;
e: Extended;
begin
  btn4.Enabled:= False;
  btn6.Enabled:= False;
  btn7.Enabled:= False;
    dm.qrytmp.SQL.Clear;
    dm.qrytmp.SQL.Text := 'create table #employee_nameList('+
      'seqno int ,empcode nvarchar(20),chinesename nvarchar(20),empid int,months varchar(6),pension_type char(2))' +#13+
      'select seqno,empcode,chinesename,empid,months,pension_type from #employee_nameList';
    dm.qrytmp.ExecSQL;

    dm.qrytmp.SQL.Clear;
    dm.qrytmp.SQL.Text := 'select seqno,empcode,chinesename,empid,months,pension_type from #employee_nameList';
    dm.qrytmp.open;
    try
      try
        for row:=1 to  sgList.RowCount-2 do
        begin
          dm.qrytmp.Append;
          dm.qrytmp.FieldByName('seqno').AsInteger:= row;
          dm.qrytmp.FieldByName('empcode').asstring:= trim(sgList.Cells[0,row]);
          dm.qrytmp.FieldByName('chinesename').asstring:= trim(sgList.Cells[1,row]);
          dm.qrytmp.FieldByName('empid').AsInteger:= 0;
          dm.qrytmp.FieldByName('months').asstring:= trim(sgList.Cells[2,row]);
          dm.qrytmp.FieldByName('pension_type').asstring:= trim(sgList.Cells[3,row]);
          dm.qrytmp.Post;
        end;

        DM.qrytmp.Close;
        dm.qrytmp.SQL.Text:='update #employee_nameList set empid = employeemsg.rkey '+#13+
                            ' from #employee_nameList inner join employeemsg on #employee_nameList.empcode = employeemsg.employeecode '+ #13+
                            ' and #employee_nameList.chinesename = employeemsg.chinesename';

        DM.qrytmp.ExecSQL;

        dm.qrytmp.Close;
        dm.qrytmp.SQL.Text := 'select * from #employee_nameList order by seqno';
        dm.qrytmp.Open;

        while not dm.qrytmp.Eof do
        begin
          i := dm.qrytmp.FieldValues['seqno'];
          if dm.qrytmp.FieldValues['empid'] = 0 then
            stringgrid6.Cells[4,i] := '工号或姓名不正确'
          else
            stringgrid6.Cells[4,i] := '通过';
          dm.qrytmp.Next;
        end;
      except

      end;
    finally
      btn6.Enabled := true;
      showmessage('检查完毕');
      sgList.Refresh;
      btn7.Enabled:= True;
    end;
end;

procedure TFrm_main.btn6Click(Sender: TObject);
begin
  btn4.Enabled:= False;
  btn5.Enabled:= False;
  btn7.Enabled:= False;
  try
    try
      with dm.qrytmp do
      begin
        Close;
        SQL.text:= 'insert into hr_pension(empid,months,pension_type) ' + #13+
                'select empid,months,pension_type from #employee_nameList where empid <>0';
        ExecSQL;
      end;
    except
      ShowMessage('月份或类型中存在空值');
      exit;
    end;
  finally
    dm.qrytmp.Close;
    dm.qrytmp.SQL.Clear;
    dm.qrytmp.SQL.Text := 'drop table #employee_nameList';
    dm.qrytmp.ExecSQL;
    btn7.Enabled:=true;
    btn6.Enabled:= False;
    btn4.Enabled:= True;
    ShowMessage('导入成功');
  end;
end;

procedure TFrm_main.btn7Click(Sender: TObject);
var
  tmp:string;
  s,e:TDateTime;
begin
  if Trim(edt2.Text) = '' then
  begin
    ShowMessage('请先输入重算月份！！');
    exit;
  end;
  tmp:= Copy(Trim(edt2.Text),1,4) + '-' + Copy(Trim(edt2.Text),5,2)+ '-01';
  if not TryStrToDate(tmp,s) then
  begin
    ShowMessage('输入月份的格式不对！！');
    edt2.SetFocus;
    Exit;
  end;
  e:= IncDay(IncMonth(s,1),-1);
  Screen.Cursor:= crSQLWait;
  try
    with dm.qrytmp do
    begin
      close;
      sql.Text:= 'exec hrsp_MealAnalysis ' + QuotedStr(DateTimeToStr(s)) +','+ QuotedStr(DateTimeToStr(e));
  //    ShowMessage(SQL.Text);
      ExecSQL;
    end;
  finally
    Screen.Cursor:= crDefault;
  end;
  ShowMessage('重算完成');
end;

end.
