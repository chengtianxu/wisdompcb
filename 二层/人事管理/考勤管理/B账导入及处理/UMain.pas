unit UMain;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ComCtrls, ExtCtrls, StdCtrls, Grids, DBGridEh, OleServer, Excel2000,
  ComObj,DateUtils,common,strUtils, DB, ADODB, Menus;

type
  TfrmMain = class(TForm)
    pnl1: TPanel;
    pgc1: TPageControl;
    ts1: TTabSheet;
    TabSheet1: TTabSheet;
    ts2: TTabSheet;
    pnl2: TPanel;
    pnl3: TPanel;
    btn_model: TButton;
    btn_import1: TButton;
    btn_SelExcel1: TButton;
    btn_Check1: TButton;
    btn_qry1: TButton;
    pnl4: TPanel;
    pnl5: TPanel;
    eh1: TDBGridEh;
    edt_value: TEdit;
    StringGrid1: TStringGrid;
    dlgOpen1: TOpenDialog;
    edt_YM: TEdit;
    lbl1: TLabel;
    pnl7: TPanel;
    pnl8: TPanel;
    pnl10: TPanel;
    pnl11: TPanel;
    pnl12: TPanel;
    pnl13: TPanel;
    pnl14: TPanel;
    StringGrid2: TStringGrid;
    eh2: TDBGridEh;
    btn_Model2: TButton;
    btn_OpenFile2: TButton;
    btn_import2: TButton;
    lbl2: TLabel;
    edt_value2: TEdit;
    btn_Qry2: TButton;
    edt_YM2: TEdit;
    pnl15: TPanel;
    pnl16: TPanel;
    pnl17: TPanel;
    pnl18: TPanel;
    pnl19: TPanel;
    btn_model3: TButton;
    btn_OpenFile3: TButton;
    btn_check3: TButton;
    btn_import3: TButton;
    lbl_YM3: TLabel;
    edt_YM3: TEdit;
    edt_Value3: TEdit;
    btn_Qry3: TButton;
    eh3: TDBGridEh;
    StringGrid3: TStringGrid;
    pb1: TProgressBar;
    lblCount: TLabel;
    ts3: TTabSheet;
    btn1: TButton;
    ds1: TDataSource;
    qry_class: TADOQuery;
    qry_classchinesename: TWideStringField;
    qry_classemployeecode: TWideStringField;
    qry_classcheckdate: TDateTimeField;
    qry_classclassname: TWideStringField;
    lbl_field1: TLabel;
    lbl4: TLabel;
    ds2: TDataSource;
    qry_Lclass: TADOQuery;
    ds3: TDataSource;
    qry_Holiday: TADOQuery;
    WideStringField4: TWideStringField;
    WideStringField5: TWideStringField;
    DateTimeField2: TDateTimeField;
    WideStringField6: TWideStringField;
    qry_Lclasschinesename: TWideStringField;
    qry_Lclassemployeecode: TWideStringField;
    qry_Lclasscheckdate: TDateTimeField;
    qry_Lclassresttype: TIntegerField;
    lbl5: TLabel;
    lbl_field2: TLabel;
    lbl3: TLabel;
    dtp1: TDateTimePicker;
    dtp2: TDateTimePicker;
    lbl6: TLabel;
    lbl7: TLabel;
    lbl8: TLabel;
    btn2: TButton;
    qry_classrkey: TAutoIncField;
    qry_Lclassrkey: TAutoIncField;
    pm1: TPopupMenu;
    mniN1: TMenuItem;
    pm2: TPopupMenu;
    mniedit2: TMenuItem;
    qry_classclassid: TIntegerField;
    qry_Lclassclassid: TIntegerField;
    Label1: TLabel;
    lbl9: TLabel;
    Label2: TLabel;
    btn_BakData: TButton;
    btn_ReInsert: TButton;
    lbl10: TLabel;
    lbl11: TLabel;
    lbl12: TLabel;
    BDate: TDateTimePicker;
    EDate: TDateTimePicker;
    qrytemp: TADOQuery;
    edt1: TEdit;
    edt2: TEdit;
    edt3: TEdit;
    chk1: TCheckBox;
    NDate1: TDateTimePicker;
    NTime: TDateTimePicker;
    qry_UpdateView: TADOQuery;
    procedure btn_qry1Click(Sender: TObject);
    procedure btn_SelExcel1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure btn_import1Click(Sender: TObject);
    procedure btn_OpenFile2Click(Sender: TObject);
    procedure btn_import2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btn_modelClick(Sender: TObject);
    procedure btn_Model2Click(Sender: TObject);
    procedure btn_model3Click(Sender: TObject);
    procedure btn_modelExport1Click(Sender: TObject);
    procedure eh1TitleClick(Column: TColumnEh);
    procedure eh2TitleClick(Column: TColumnEh);
    procedure btn_OpenFile3Click(Sender: TObject);
    procedure btn_Qry2Click(Sender: TObject);
    procedure btn_import3Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure mniN1Click(Sender: TObject);
    procedure mniedit2Click(Sender: TObject);
    procedure edt_valueChange(Sender: TObject);
    procedure edt_value2Change(Sender: TObject);
    procedure btn_BakDataClick(Sender: TObject);
    procedure btn_ReInsertClick(Sender: TObject);
    procedure chk1Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn,PreColumn2: TColumnEh;
    NDate,BMonth,EMonth:string;
  public
    { Public declarations }
  end;

var
  frmMain: TfrmMain;

implementation
      uses UDM,UEdit;
{$R *.dfm}

procedure TfrmMain.btn_qry1Click(Sender: TObject);
begin
  if trim(edt_ym.text)='' then
  begin
  showmessage('请先输入要录入的年月eg:2017-01');
  exit;
  end;
       qry_class.Filtered:=false;
       qry_class.Close;
       qry_class.Parameters[0].Value:=Trim(edt_YM.Text);
       qry_class.Open;

end;

procedure TfrmMain.btn_SelExcel1Click(Sender: TObject);
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
begin
   if dlgOpen1.Execute then  fileName:=dlgOpen1.FileName else exit;
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
            ShowMessage('打开成功');
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   stringgrid1.Refresh;
   stringgrid1.FixedRows := 1;

end;

procedure TfrmMain.FormCreate(Sender: TObject);
begin


  user_ptr := '3553';
  vprev := '4';
   // dm.con1.Open;


  if not App_init_2(DM.con1) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end;


  Caption := application.Title;


end;

procedure TfrmMain.btn_import1Click(Sender: TObject);
var itmp,i,row,k: integer;
Lsql:string;
begin

  if trim(edt_ym.text)='' then
  begin
  showmessage('请先输入要录入的年月eg:2017-01');
  exit;
  end;

  if stringgrid1.Cells[1,1]='' then
  begin
  showmessage('请先打开要导入文件！');
  exit;
  end;

  if Messagedlg('你确定给月份 '+edt_YM.Text+'，列表中的员工重新排班吗?',mtWarning,[mbYES,mbNO],0)=6 then
  begin
    try
     dm.con1.BeginTrans;
     dm.qry_temp.SQL.Clear;
     dm.qry_temp.sql.text:='if exists (select * from tempdb.dbo.sysobjects  '+
                          ' where id = object_id(N''tempdb..#onoffdutydata'')        '+
                          ' and type=''U'')           '+
                          ' drop table #onoffdutydata  ';
    dm.qry_temp.ExecSQL;

    k:= strtoint(RightStr(DateToStr(EndOfTheMonth(strToDate(edt_YM.Text+'-01'))),2));
    itmp := 1;
    dm.qry_temp.SQL.Clear;
    dm.qry_temp.SQL.Text := 'create table #onoffdutydata(rkey int,checkdate datetime,'+
      'employeeid int,classid int,employeecode nvarchar(20),chinesename nvarchar(20),'+
      'classname nvarchar(20))';
    dm.qry_temp.ExecSQL;
     try
      for i:=1 to k do
        begin
          for row:=1 to  stringgrid1.RowCount-1 do
            begin
              dm.qry_temp.SQL.Clear;
              if i<10 then
                begin
                  dm.qry_temp.SQL.Text := 'insert into #onoffdutydata '+
                    '  select  0,'+#39+edt_YM.Text+'-0'+stringgrid1.Cells[i+1,0]+#39+',0,0,'+ //RKEY,CHECKDATE,EMPLOYEEID,CLASSID
                    #39+stringgrid1.Cells[0,row]+#39+','+ #39+stringgrid1.Cells[1,row]+#39+','+  //EMPLOYEECODE  ,chinesename
                    #39+stringgrid1.Cells[i+1,row]+#39;
                  dm.qry_temp.ExecSQL;
                  itmp := itmp+1;
                  pb1.Position := Trunc(itmp/(stringgrid1.RowCount*k)*90);
                  application.ProcessMessages;
                end
              else
                begin
                  dm.qry_temp.SQL.Text := 'insert into #onoffdutydata '+
                    '  select  0,'+#39+edt_YM.Text+'-'+stringgrid1.Cells[i+1,0]+#39+',0,0,'+ //RKEY,CHECKDATE,EMPLOYEEID,CLASSID
                    #39+stringgrid1.Cells[0,row]+#39+','+ #39+stringgrid1.Cells[1,row]+#39+','+  //EMPLOYEECODE  ,chinesename
                    #39+stringgrid1.Cells[i+1,row]+#39;
                  dm.qry_temp.ExecSQL;
                  itmp := itmp+1;
                  pb1.Position := Trunc(itmp/(stringgrid1.RowCount*k)*90);
                  application.ProcessMessages;
                end;
            end;
        end;

//     Lsql:='select  *  into  onoffdutydata_temp02 from #onoffdutydata  ' ;
//     if not common.execsql(dm.qry_temp,Lsql)  then Exit;

      dm.qry_Class.ExecSQL;    //更新到onoffdutydata
     finally
      dm.qry_temp.SQL.Clear;
      dm.qry_temp.sql.text:='if exists (select * from tempdb.dbo.sysobjects  '+
                          ' where id = object_id(N''tempdb..#onoffdutydata'')        '+
                          ' and type=''U'')           '+
                          ' drop table #onoffdutydata  ';
      dm.qry_temp.ExecSQL;

      pb1.Position := 100 ;
      application.ProcessMessages;
        Screen.Cursor := crdefault;
      
     end;

     dm.con1.CommitTrans;
     showmessage('导入完毕');
      for i :=1  to stringgrid1.RowCount-1 do
      begin
      stringgrid1.Rows[i].Clear;
      end;
      stringgrid1.RowCount:=5;

    except on e:exception do
    begin
    showmessage('错误：'+e.message);
    dm.con1.RollbackTrans;
    exit;
    end;
    end;
  end;
end;

procedure TfrmMain.btn_OpenFile2Click(Sender: TObject);
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
  j: Integer;
  a:string;
begin
   if dlgOpen1.Execute then  fileName:=dlgOpen1.FileName else exit;
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

      try XLApp.workBooks.Open(fileName);
       Sheet := XLApp.Workbooks[1].WorkSheets[1];
       for iCount:=1 to 50000 do
       begin

           for j:=3 to 33 do
           begin
             //showmessage(trim(XLApp.workbooks[1].sheets[1].cells[iCount+1,j]));
           if  Length(trim(XLApp.workbooks[1].sheets[1].cells[iCount+1,j]))>1 then
           begin
           ShowMessage('请仔细检查导入文件，类型长度不能大于1:'+trim(XLApp.workbooks[1].sheets[1].cells[iCount+1,j]));
           exit;
           end;
           end;

                 if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]) <> '')
                 and (trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]) <> '') then
                 begin

                  stringgrid2.Cells[0,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,1]);


                  stringgrid2.Cells[1,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,2]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,3])=''  then
                   stringgrid2.Cells[2,iCount-1] :='7'
                   else
                  stringgrid2.Cells[2,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,3]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,4])=''  then
                   stringgrid2.Cells[3,iCount-1] :='7'
                   else
                  stringgrid2.Cells[3,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,4]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,5])=''  then
                   stringgrid2.Cells[4,iCount-1] :='7'
                   else
                  stringgrid2.Cells[4,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,5]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,6])=''  then
                   stringgrid2.Cells[5,iCount-1] :='7'
                   else
                  stringgrid2.Cells[5,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,6]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,7])=''  then
                   stringgrid2.Cells[6,iCount-1] :='7'
                   else
                  stringgrid2.Cells[6,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,7]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,8])=''  then
                   stringgrid2.Cells[7,iCount-1] :='7'
                   else
                  stringgrid2.Cells[7,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,8]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,9])=''  then
                   stringgrid2.Cells[8,iCount-1] :='7'
                   else
                  stringgrid2.Cells[8,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,9]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,10])=''  then
                   stringgrid2.Cells[9,iCount-1] :='7'
                   else
                  stringgrid2.Cells[9,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,10]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,11])=''  then
                   stringgrid2.Cells[10,iCount-1] :='7'
                   else
                  stringgrid2.Cells[10,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,11]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,12])=''  then
                   stringgrid2.Cells[11,iCount-1] :='7'
                   else
                  stringgrid2.Cells[11,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,12]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,13])=''  then
                   stringgrid2.Cells[12,iCount-1] :='7'
                   else
                  stringgrid2.Cells[12,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,13]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,14])=''  then
                   stringgrid2.Cells[13,iCount-1] :='7'
                   else
                  stringgrid2.Cells[13,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,14]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,15])=''  then
                   stringgrid2.Cells[14,iCount-1] :='7'
                   else
                  stringgrid2.Cells[14,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,15]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,16])=''  then
                   stringgrid2.Cells[15,iCount-1] :='7'
                   else
                  stringgrid2.Cells[15,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,16]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,17])=''  then
                   stringgrid2.Cells[16,iCount-1] :='7'
                   else
                  stringgrid2.Cells[16,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,17]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,18])=''  then
                   stringgrid2.Cells[17,iCount-1] :='7'
                   else
                  stringgrid2.Cells[17,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,18]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,19])=''  then
                   stringgrid2.Cells[18,iCount-1] :='7'
                   else
                  stringgrid2.Cells[18,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,19]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,20])=''  then
                   stringgrid2.Cells[19,iCount-1] :='7'
                   else
                  stringgrid2.Cells[19,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,20]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,21])=''  then
                   stringgrid2.Cells[20,iCount-1] :='7'
                   else
                  stringgrid2.Cells[20,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,21]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,22])=''  then
                   stringgrid2.Cells[21,iCount-1] :='7'
                   else
                  stringgrid2.Cells[21,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,22]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,23])=''  then
                   stringgrid2.Cells[22,iCount-1] :='7'
                   else
                  stringgrid2.Cells[22,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,23]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,24])=''  then
                   stringgrid2.Cells[23,iCount-1] :='7'
                   else
                  stringgrid2.Cells[23,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,24]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,25])=''  then
                   stringgrid2.Cells[24,iCount-1] :='7'
                   else
                  stringgrid2.Cells[24,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,25]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,26])=''  then
                   stringgrid2.Cells[25,iCount-1] :='7'
                   else
                  stringgrid2.Cells[25,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,26]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,27])=''  then
                   stringgrid2.Cells[26,iCount-1] :='7'
                   else
                  stringgrid2.Cells[26,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,27]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,28])=''  then
                   stringgrid2.Cells[27,iCount-1] :='7'
                   else
                  stringgrid2.Cells[27,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,28]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,29])=''  then
                   stringgrid2.Cells[28,iCount-1] :='7'
                   else
                  stringgrid2.Cells[28,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,29]);

                   if trim(XLApp.workbooks[1].sheets[1].cells[iCount,30])=''  then
                   stringgrid2.Cells[29,iCount-1] :='7'
                   else
                  stringgrid2.Cells[29,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,30]);

              a:=trim(XLApp.workbooks[1].sheets[1].cells[1,31]);
                   if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,31])='') and  (trim(XLApp.workbooks[1].sheets[1].cells[1,31])<>'')   then
                   stringgrid2.Cells[30,iCount-1] :='7'
                   else
                  stringgrid2.Cells[30,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,31]);
 //////////////////////
                   if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,32])='')  and (trim(XLApp.workbooks[1].sheets[1].cells[1,32])<>'') then
                   stringgrid2.Cells[31,iCount-1] :='7'
                   else
                  stringgrid2.Cells[31,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,32]);

                   if (trim(XLApp.workbooks[1].sheets[1].cells[iCount,33])='') and (trim(XLApp.workbooks[1].sheets[1].cells[1,33])<>'')  then
                   stringgrid2.Cells[32,iCount-1] :='7'
                   else
                  stringgrid2.Cells[32,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,33]);


                  stringgrid2.Cells[33,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,34]);
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
       lblcount.caption:=inttostr(stringgrid2.RowCount-1);
       ShowMessage('打开成功');
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   stringgrid2.Refresh;
   stringgrid2.FixedRows := 1;
  except on e:exception do
  begin
   ShowMessage('出错：'+inttostr(iCount)+e.Message);
  Exit;
  end

  end; 

end;

procedure TfrmMain.btn_import2Click(Sender: TObject);
var itmp,i,row,k: integer;
Lsql:string;
begin

  if trim(edt_ym2.text)='' then
  begin
  showmessage('请先输入要录入的年月如:2017-01');
  exit;
  end;

  if stringgrid2.Cells[1,1]='' then
  begin
  showmessage('请先打开要导入文件!');
  exit;
  end;

  if Messagedlg('你确定给月份 '+edt_YM2.Text+'，列表中的员工重新排班吗?',mtWarning,[mbYES,mbNO],0)=6 then
  begin
   try
     dm.con1.BeginTrans;
      dm.qry_temp.SQL.Clear;
     dm.qry_temp.sql.text:='if exists (select * from tempdb.dbo.sysobjects  '+
                          ' where id = object_id(N''tempdb..#onoffdutydata'')        '+
                          ' and type=''U'')           '+
                          ' drop table #onoffdutydata  ';

    dm.qry_temp.ExecSQL;

    k:= strtoint(RightStr(DateToStr(EndOfTheMonth(strToDate(edt_YM2.Text+'-01'))),2));
    itmp := 1;
    dm.qry_temp.SQL.Clear;
    dm.qry_temp.SQL.Text := 'create table #onoffdutydata(rkey int,checkdate datetime,'+    //#onoffdutydata
      'employeeid int,classid int,employeecode nvarchar(20),chinesename nvarchar(20),'+
      'resttype nvarchar(20))';
    dm.qry_temp.ExecSQL;
    
     try
      for i:=1 to k do
        begin
          for row:=1 to  stringgrid2.RowCount-1 do
            begin
              dm.qry_temp.SQL.Clear;
              if i<10 then
                begin
                  dm.qry_temp.SQL.Text := 'insert into #onoffdutydata '+
                    '  select  0,'+#39+edt_YM2.Text+'-0'+stringgrid2.Cells[i+1,0]+#39+',0,0,'+ //RKEY,CHECKDATE,EMPLOYEEID,CLASSID
                    #39+stringgrid2.Cells[0,row]+#39+','+ #39+stringgrid2.Cells[1,row]+#39+','+  //EMPLOYEECODE  ,chinesename
                    #39+stringgrid2.Cells[i+1,row]+#39;
                    try
                    dm.qry_temp.ExecSQL;
                    except on e:exception do
                    begin
                    showmessage('错误：'+e.message);
                    exit;
                    end;
                    end;
                  itmp := itmp+1;
                  pb1.Position := Trunc(itmp/(stringgrid2.RowCount*k)*90);
                  application.ProcessMessages;

                end
              else
                begin
                  dm.qry_temp.SQL.Text := 'insert into #onoffdutydata'+
                    '  select  0,'+#39+edt_YM2.Text+'-'+stringgrid2.Cells[i+1,0]+#39+',0,0,'+ //RKEY,CHECKDATE,EMPLOYEEID,CLASSID
                    #39+stringgrid2.Cells[0,row]+#39+','+ #39+stringgrid2.Cells[1,row]+#39+','+  //EMPLOYEECODE  ,chinesename
                    #39+stringgrid2.Cells[i+1,row]+#39;
                  try
                  dm.qry_temp.ExecSQL;
                  except on e:exception do
                    begin
                    showmessage('错误：'+e.message);
                    exit;
                    end;
                   end; 
                  itmp := itmp+1;
                  pb1.Position := Trunc(itmp/(stringgrid2.RowCount*k)*90);
                  application.ProcessMessages;
                end;

//                     Lsql:='select count(resttype)resttype from #onoffdutydata ' ;
//             if not common.OpenQuery(dm.qry_temp,Lsql)  then Exit;
//
//              ShowMessage(IntToStr(dm.qry_temp.recordcount));
            end;


        end;




       Lsql:=  'if exists (select * from sysobjects where name=''onoffdutydata_temp'')  drop table onoffdutydata_temp   ';

        dm.qry_temp.close;
        dm.qry_temp.sql.Clear;
        dm.qry_temp.sql.Text:=Lsql;
        dm.qry_temp.ExecSQL;

        Lsql:=Lsql+'select  *  into  onoffdutydata_temp from #onoffdutydata  ' ;
        dm.qry_temp.close;
        dm.qry_temp.sql.Clear;
        dm.qry_temp.sql.Text:=Lsql;
        dm.qry_temp.ExecSQL;


      dm.qry_LClass.ExecSQL;    //更新轮班到onoffdutydata

     finally
      dm.qry_temp.SQL.Clear;
       dm.qry_temp.sql.text:='if exists (select * from tempdb.dbo.sysobjects  '+
                          ' where id = object_id(N''tempdb..#onoffdutydata'')        '+
                          ' and type=''U'')           '+
                          ' drop table #onoffdutydata  ';
      dm.qry_temp.ExecSQL;

      pb1.Position := 100 ;
      application.ProcessMessages;
    end;

    dm.con1.CommitTrans;
    showmessage('导入完毕');

       for i :=1  to stringgrid2.RowCount-1 do
      begin
      stringgrid2.Rows[i].Clear;
      end;
      stringgrid2.RowCount:=5;
    
    except on e:exception do
    begin
    showmessage('错误：'+e.message);
    dm.con1.RollbackTrans;
    exit;
    end;
    end;
  end;

end;

procedure TfrmMain.FormShow(Sender: TObject);
begin
self.pgc1.ActivePageIndex:=0;

self.edt_YM.text:= formatdatetime('yyyy-mm',Incmonth(now,-1));
edt_YM2.text:= formatdatetime('yyyy-mm',Incmonth(now,-1));

 EDate.Date:= Incmonth(now,-2);

PreColumn:=eh1.Columns[0];
PreColumn2:=eh2.Columns[0];

  PreColumn.Title.Color := clred ;
  PreColumn2.Title.Color := clred ;

//   edt1.Visible:=false;
//   edt2.Visible:=false;
//   edt3.Visible:=false;

   NDate1.Date:=now;
   Ntime.Date:=now;
   NDate1.Visible :=false;
   NTime.Visible:=false;
   
end;

procedure TfrmMain.btn_modelClick(Sender: TObject);
var

  XLApp: Variant;
  Sheet: Variant;
begin
 if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := '排班导入模版';
  Sheet := XLApp.Workbooks[1].WorkSheets['排班导入模版'];

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

stringgrid1.Cells[0,1] := '请注意当月的天数';


   XlApp.Visible := True;
end;

procedure TfrmMain.btn_Model2Click(Sender: TObject);
var

  XLApp: Variant;
  Sheet: Variant;
begin
 if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := '排班导入模版';
  Sheet := XLApp.Workbooks[1].WorkSheets['排班导入模版'];

Sheet.Cells[1,1] := '员工编号';
Sheet.Cells[1,2] := '姓名';
Sheet.Cells[1,3] := '1';
Sheet.Cells[1,4] := '2';
Sheet.Cells[1,5] := '3';
Sheet.Cells[1,6] := '4';
Sheet.Cells[1,7] := '5';
Sheet.Cells[1,8] := '6';
Sheet.Cells[1,9] := '7';
Sheet.Cells[1,10] := '8';
Sheet.Cells[1,11] := '9';
Sheet.Cells[1,12] := '10';
Sheet.Cells[1,13] := '11';
Sheet.Cells[1,14] := '12';
Sheet.Cells[1,15] := '13';
Sheet.Cells[1,16] := '14';
Sheet.Cells[1,17] := '15';
Sheet.Cells[1,18] := '16';
Sheet.Cells[1,19] := '17';
Sheet.Cells[1,20] := '18';
Sheet.Cells[1,21] := '19';
Sheet.Cells[1,22] := '20';
Sheet.Cells[1,23] := '21';
Sheet.Cells[1,24] := '22';
Sheet.Cells[1,25] := '23';
Sheet.Cells[1,26] := '24';
Sheet.Cells[1,27] := '25';
Sheet.Cells[1,28] := '26';
Sheet.Cells[1,29] := '27';
Sheet.Cells[1,30] := '28';
Sheet.Cells[1,31] := '29';
Sheet.Cells[1,32] := '30';
Sheet.Cells[1,33] := '31';

Sheet.Cells[2,1] := '请注意当月的天数';


   XlApp.Visible := True;
end;
 

procedure TfrmMain.btn_model3Click(Sender: TObject);
var

  XLApp: Variant;
  Sheet: Variant;
begin
 if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := '排班导入模版';
  Sheet := XLApp.Workbooks[1].WorkSheets['排班导入模版'];

Sheet.Cells[1,1] := '员工编号';
Sheet.Cells[1,2] := '姓名';
Sheet.Cells[1,3] := '请假类型';
Sheet.Cells[1,4] := '开始时间';
Sheet.Cells[1,5] := '结束时间';
Sheet.Cells[1,6] := '请假理由';
Sheet.Cells[1,7] := '登记人';


Sheet.Cells[2,1] := '123001';
Sheet.Cells[2,2] := '张三';
Sheet.Cells[2,3] := '事假';
Sheet.Cells[2,4] := '2017-01-01 08:00:000';
Sheet.Cells[2,5] := '2017-01-01 17:30:000';
Sheet.Cells[2,6] := '有事要处理';
Sheet.Cells[2,7] := '冯笑情';

  Sheet.Cells[3,1] := '请假理由请一定要录入,请严格按给定日期格式导入。';
   XlApp.Visible := True;
end;


procedure TfrmMain.btn_modelExport1Click(Sender: TObject);
var

  XLApp: Variant;
  Sheet: Variant;
begin
 if not VarIsEmpty(XLApp) then
  begin
    XLApp.DisplayAlerts := False;
    XLApp.Quit;
    VarClear(XLApp);
  end;
  try
    XLApp := CreateOleObject('Excel.Application');
  except
    Screen.Cursor := crDefault;
    Exit;
  end;
  XLApp.WorkBooks.Add;
  XLApp.SheetsInNewWorkbook := 1;

  XLApp.WorkBooks[1].WorkSheets[1].Name := '排班导入模版';
  Sheet := XLApp.Workbooks[1].WorkSheets['排班导入模版'];

Sheet.Cells[1,1] := '员工编号';
Sheet.Cells[1,2] := '姓名';
Sheet.Cells[1,3] := '1';
Sheet.Cells[1,4] := '2';
Sheet.Cells[1,5] := '3';
Sheet.Cells[1,6] := '4';
Sheet.Cells[1,7] := '5';
Sheet.Cells[1,8] := '6';
Sheet.Cells[1,9] := '7';
Sheet.Cells[1,10] := '8';
Sheet.Cells[1,11] := '9';
Sheet.Cells[1,12] := '10';
Sheet.Cells[1,13] := '11';
Sheet.Cells[1,14] := '12';
Sheet.Cells[1,15] := '13';
Sheet.Cells[1,16] := '14';
Sheet.Cells[1,17] := '15';
Sheet.Cells[1,18] := '16';
Sheet.Cells[1,19] := '17';
Sheet.Cells[1,20] := '18';
Sheet.Cells[1,21] := '19';
Sheet.Cells[1,22] := '20';
Sheet.Cells[1,23] := '21';
Sheet.Cells[1,24] := '22';
Sheet.Cells[1,25] := '23';
Sheet.Cells[1,26] := '24';
Sheet.Cells[1,27] := '25';
Sheet.Cells[1,28] := '26';
Sheet.Cells[1,29] := '27';
Sheet.Cells[1,30] := '28';
Sheet.Cells[1,31] := '29';
Sheet.Cells[1,32] := '30';
Sheet.Cells[1,33] := '31';

Sheet.Cells[2,1] := '请注意当月的天数';


   XlApp.Visible := True;

end;

procedure TfrmMain.eh1TitleClick(Column: TColumnEh);
begin
  if qry_class.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_class.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_class.Sort:=Column.FieldName+' DESC';
  end;

  if qry_class.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (PreColumn.FieldName <> column.FieldName) then
  begin
    lbl_field1.Caption := column.Title.Caption ;
    //PreColumn.FieldName := column.FieldName ;
    edt_value.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn := column ;
  end else
    edt_value.SetFocus;
end;


procedure TfrmMain.eh2TitleClick(Column: TColumnEh);
begin
  if qry_Lclass.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    qry_Lclass.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    qry_Lclass.Sort:=Column.FieldName+' DESC';
  end;

  if qry_Lclass.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;

  if (PreColumn2.FieldName <> column.FieldName) then
  begin
    lbl_field2.Caption := column.Title.Caption ;
    //PreColumn2.FieldName := column.FieldName ;
    edt_value2.SetFocus;
    PreColumn2.Title.Color := clBtnFace;
    Column.Title.Color := clred ;
    PreColumn2 := column ;
  end else
    edt_value2.SetFocus;
end;

procedure TfrmMain.btn_OpenFile3Click(Sender: TObject);
var
  fileName:String;
  iCount,limit: Integer;
  tmp1 : Single;
  XLApp: variant;
  Sheet: Variant;
begin
   if dlgOpen1.Execute then  fileName:=dlgOpen1.FileName else exit;
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
                  stringgrid3.Cells[2,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,3]);
                  stringgrid3.Cells[3,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,4]);
                  stringgrid3.Cells[4,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,5]);
                  stringgrid3.Cells[5,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,6]);
                  stringgrid3.Cells[6,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,7]);
                  stringgrid3.Cells[7,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,8]);
                  stringgrid3.Cells[8,iCount-1] := trim(XLApp.workbooks[1].sheets[1].cells[iCount,9]);


                  stringgrid3.RowCount := iCount;
                  application.ProcessMessages;
                 end
                 else begin
                       Inc(limit);
                       if limit >= 6 then
                       Break;
                 end;
       end;
       
        stringgrid3.ColWidths[0] := 60;
       stringgrid3.ColWidths[1] := 60;
       stringgrid3.ColWidths[2] := 50;
       stringgrid3.ColWidths[3] := 180;
       stringgrid3.ColWidths[4] := 180;
       stringgrid3.ColWidths[5] := 60;
       stringgrid3.ColWidths[6] := 60;


       XLApp.workbooks[1].close;
       lblcount.caption:=inttostr(stringgrid3.RowCount-1);
            ShowMessage('打开成功');
  finally
       XLApp.quit;
       Screen.Cursor := crDefault;
  end;
   stringgrid3.Refresh;
   stringgrid3.FixedRows := 1;
end;

procedure TfrmMain.btn_Qry2Click(Sender: TObject);
begin
  if trim(edt_ym2.text)='' then
  begin
  showmessage('请先输入要录入的年月eg:2017-01');
  exit;
  end;
  
       qry_Lclass.Filtered:=false;
       qry_Lclass.Close;
       qry_Lclass.Parameters[0].Value:=Trim(edt_YM2.Text);
       qry_Lclass.Open;


end;

procedure TfrmMain.btn_import3Click(Sender: TObject);
var itmp,i,row,k: integer;
 ADate:Tdatetime;
 Lsql:string;
begin

//  if trim(edt_ym.text)='' then
//  begin
//  showmessage('请先输入要录入的年月eg:2017-01');
//  exit;
//  end;

 if stringgrid3.Cells[1,1]='' then
  begin
  showmessage('请先打开要导入文件！');
  exit;
  end;

  if Messagedlg('你确定导入以下请假吗?',mtWarning,[mbYES,mbNO],0)=6 then
  begin
   try
    dm.con1.BeginTrans;
   dm.qry_temp.SQL.Clear;
   dm.qry_temp.sql.text:='if exists (select * from tempdb.dbo.sysobjects  '+
                          ' where id = object_id(N''tempdb..#holiday'')        '+
                          ' and type=''U'')           '+
                          ' drop table #holiday  ';
    dm.qry_temp.ExecSQL;

     dm.qry_temp.SQL.Clear;
    dm.qry_temp.SQL.Text := 'create table #holiday( '+
      ' employeecode nvarchar(20),chinesename nvarchar(20),'+
      'leavetype nvarchar(10),startdate datetime, enddate  datetime, leavereason varchar(100), RMan varchar(10), ' +
      'employeeid int, LTID int, RManID int  )';

    dm.qry_temp.ExecSQL;

    try

          for row:=1 to  stringgrid3.RowCount-1 do
            begin

//              if  (not TryStrToDate(stringgrid3.Cells[4,row],adate,'yyyy-MM-dd hh:mm:ss')) or ( not TryStrToDate(stringgrid3.Cells[5,row],adate,'yyyy-MM-dd hh:mm:ss')) then
//              begin
//              ShowMessage('有时间格式不对， 请重新整理再导入！');
//              exit;
//              end;

              dm.qry_temp.SQL.Clear;
              dm.qry_temp.SQL.Text := 'insert into #holiday '+
                '  select ''' +stringgrid3.Cells[0,row] +''','''+stringgrid3.Cells[1,row] +''','+
                ' '''+ stringgrid3.Cells[2,row] +''','''+stringgrid3.Cells[3,row]  +''','''+ stringgrid3.Cells[4,row]  +''','+
                ' '''+ stringgrid3.Cells[5,row] +''', '''+stringgrid3.Cells[6,row]+''',0,0,0' ;
//                 if  stringgrid3.Cells[0,row]='810533' then
//                  ShowMessage(dm.qry_temp.SQL.Text);
              dm.qry_temp.ExecSQL;
              itmp := itmp+1;
              pb1.Position := Trunc(itmp/(stringgrid3.RowCount*7)*90);
              application.ProcessMessages;
            end;

            dm.qry_holiday.execsql; //更新AskLeaveRegister

//      Lsql:='select  *  into  holiday_temp01 from #holiday  ' ;
//     if not common.execsql(dm.qry_temp,Lsql)  then Exit;


     finally
      dm.qry_temp.SQL.Clear;
       dm.qry_temp.sql.text:='if exists (select * from tempdb.dbo.sysobjects  '+
                          ' where id = object_id(N''tempdb..#holiday'')        '+
                          ' and type=''U'')           '+
                          ' drop table #holiday  ';
    dm.qry_temp.ExecSQL;

      pb1.Position := 100 ;
      application.ProcessMessages;
        Screen.Cursor := crdefault;
  
    end;
    dm.con1.CommitTrans;
     showmessage('导入完毕');

      for i :=1  to stringgrid3.RowCount-1 do
      begin
      stringgrid3.Rows[i].Clear;
      end;
      stringgrid3.RowCount:=5;
    except on e:exception do
    begin
    showmessage('错误：'+e.message);
    dm.con1.RollbackTrans;
    exit;
    end;
    end;
 end;
end;

procedure TfrmMain.btn1Click(Sender: TObject);
var
  Lsql:string;
begin
  Screen.Cursor := crHourGlass;
  try
  Lsql:='update a  '+
' set  resttype=null, classid=null, OnDutyTime1=null, OffDutyTime1=null, OnDutyTime2=null, OffDutyTime2=null, OnDutyTime3=null, OffDutyTime3=null, OffDutyTime4=null, OnDutyTime4=null,'+
' YTNote=null, RWT=0, ROT=0, SumCN=0,locked=0,swt=0,owt=0, '+
' SumCT=0, SumZN=0, SumZT=0, SumKN=0, SumKT=0, SumWN=0, SumWT=0, SumJN=0, SumJT=0, SumEN=0, SumET=0, SumLT=0,SumLN=0,NCN=0,CN1=0, CT1=0, CN2=0,CT2=0,CN3=0,CT3=0,'+
' CN4=0, CT4=0, ZN1=0, ZT1=0, ZN2=0, ZT2=0, ZN3=0, ZT3=0, ZN4=0, ZT4=0, KN1=0, KT1=0, KN2=0, KT2=0, KN3=0, KT3=0, KN4=0, KT4=0, WN1=0, WT1=0, WN2=0, WT2=0, WN3=0,'+
' WT3=0, WN4=0, WT4=0, JN1=0, '+
' JT1=0, JN2=0, JT2=0, JN3=0, JT3=0, JN4=0, JT4=0, LN1=0, LT1=0, LN2=0, LT2=0, LN3=0, LT3=0, LN4=0, LT4=0, EN1=0, ET1=0, EN2=0, ET2=0, EN3=0, ET3=0, EN4=0,'+
' YT=0, OvertimeType=0, SegNo=0, cardcheck=0'+
'  from wisdompcb_HREICC..onoffdutydata a '+
'  where checkdate>='''+formatdatetime('yyyy-MM-dd',dtp1.date)+''' and   checkdate<='''+formatdatetime('yyyy-MM-dd',dtp2.date)+''' ';
   // ShowMessage(Lsql);
 if not common.ExecSql(dm.qry_temp,Lsql)  then exit;
 showmessage('初始化成功！');
 finally
   Screen.Cursor := crdefault;
 end;
end;

procedure TfrmMain.btn2Click(Sender: TObject);
var
  Lsql:string;
begin
 Screen.Cursor := crHourGlass;
  try
   if  chk1.Checked=false  then 
   if dtp2.date<strtodate('2018-01-01') then
   begin
    ShowMessage('资料已锁定不能重新计算');
   exit;
   end;
   if  chk1.Checked=true  then
   if NDate1.date<strtodate('2018-01-01') then 
    begin
    ShowMessage('资料已锁定不能重新计算');
    exit;
   end;


  try
    dm.con1.BeginTrans;
    if chk1.Checked=false then
   Lsql:='exec sp_setonoffdutydataAll_HR  '''', '''+formatdatetime('yyyy-MM-dd',dtp1.date)+''' ,'''+formatdatetime('yyyy-MM-dd',dtp2.date)+'''  '
   else
    Lsql:='exec sp_setonoffdutydataHalfDay_HR  '''', '''+formatdatetime('yyyy-MM-dd',NDate1.date)+''' ,'''+formatdatetime('yyyy-MM-dd',NDate1.date)+''', '+
       ' '''+formatdatetime('hh:mm:ss',NTime.date)+'''  ';

      dm.qry_temp.SQL.Clear;
      dm.qry_temp.sql.text:= Lsql;
      dm.qry_temp.ExecSQL;
 
   dm.con1.CommitTrans;
   showmessage('生成成功！');
  except on e: Exception do
  begin
   ShowMessage('错误 ：'+e.Message);
  dm.con1.RollbackTrans;
  end;
  end;
  finally
     Screen.Cursor := crdefault;
  end;
end;

procedure TfrmMain.mniN1Click(Sender: TObject);
var
  Lfrm:Tfrmedit;
  Lsql:string;
  rkey:integer;
begin
Lfrm:=Tfrmedit.Create(self);
 rkey:=qry_classrkey.Value;
try
 Lfrm.lbl_class.Caption:='班次：';
 Lfrm.edt_class.text:=qry_classclassname.asstring;
 Lfrm.lbl_code.Caption:=qry_classemployeecode.asstring;
 Lfrm.lbl_Ename.Caption:= qry_classchinesename.asstring;
 Lfrm.lbl_date.Caption:= qry_classcheckdate.asstring;

  if Lfrm.ShowModal=mrok then
  begin
    Lsql:='select rkey from class where classname='''+trim(Lfrm.edt_class.text)+''' ' ;
    if not common.OpenQuery(dm.qry_temp,Lsql)  then exit;
     if dm.qry_temp.FieldByName('rkey').AsString<>''  then
     begin
     qry_class.Edit;
     qry_classclassID.value:=dm.qry_temp.FieldByName('rkey').value;
     qry_class.post;
     end
     else
     begin
     qry_class.Edit;
     qry_classclassID.value:=0;
     qry_class.post;
     end;
       btn_qry1Click(btn_qry1);
       if not  qry_class.Locate('rkey',rkey,[]) then Exit;
  end;
finally
Lfrm.Free;
end;
end;

procedure TfrmMain.mniedit2Click(Sender: TObject);
var
  Lfrm:Tfrmedit;
  rkey: integer;
begin
Lfrm:=Tfrmedit.Create(self);
try
  rkey:=qry_Lclassrkey.Value;
 Lfrm.lbl_class.Caption:='类型：';
 Lfrm.edt_class.text:=qry_Lclassresttype.asstring;
 Lfrm.lbl_code.Caption:=qry_Lclassemployeecode.asstring;
 Lfrm.lbl_Ename.Caption:= qry_Lclasschinesename.asstring;
 Lfrm.lbl_date.Caption:= qry_Lclasscheckdate.asstring;
  if Lfrm.ShowModal=mrok then
  begin
   qry_Lclass.Edit;
   qry_Lclassresttype.value:=StrToInt(Lfrm.edt_class.text);
   qry_Lclass.post;
     btn_qry2Click(btn_qry2);
    if not  qry_Lclass.Locate('rkey',rkey,[]) then Exit;

  end;

finally
Lfrm.Free;
end;

end;

procedure TfrmMain.edt_valueChange(Sender: TObject);
begin
  //if qry_class.isempty then exit;
  qry_class.Filtered:=false;
  if qry_class.FieldByName(PreColumn.FieldName).FieldKind = fkCalculated then  exit;
  if qry_class.FieldByName(PreColumn.FieldName).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value.text) <> '' then
    begin
      if qry_class.FieldByName(PreColumn.FieldName).DataType in  [ftString, ftWideString]  then
        qry_class.Filter:=PreColumn.FieldName + ' like ''%' + trim(edt_value.text) + '%'' ' //+ statussql
      else if qry_class.FieldByName(PreColumn.FieldName).DataType in  [ftSmallint, ftInteger]  then
        qry_class.Filter:=  PreColumn.FieldName+' >= ' + inttostr(strtointdef(edt_value.text,0));//+ statussql;
    end else
       qry_class.Filter:='';
  end;
    qry_class.Filtered:=true;
end;

procedure TfrmMain.edt_value2Change(Sender: TObject);
begin

 // if qry_Lclass.isempty then exit;

  qry_Lclass.Filtered:=false;

  if qry_Lclass.FieldByName(PreColumn2.FieldName).FieldKind = fkCalculated then  exit;
  if qry_Lclass.FieldByName(PreColumn2.FieldName).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(edt_value2.text) <> '' then
    begin
      if qry_Lclass.FieldByName(PreColumn2.FieldName).DataType in  [ftString, ftWideString]  then
        qry_Lclass.Filter:=PreColumn2.FieldName + ' like ''%' + trim(edt_value2.text) + '%'' ' //+ statussql
      else if qry_Lclass.FieldByName(PreColumn2.FieldName).DataType in  [ftSmallint, ftInteger]  then
        qry_Lclass.Filter:=  PreColumn2.FieldName+' >= ' + inttostr(strtointdef(edt_value2.text,0));//+ statussql;
    end else
       qry_Lclass.Filter:='';
  end;
   qry_Lclass.Filtered:=true;
end;

procedure TfrmMain.btn_BakDataClick(Sender: TObject);
var
  Lsql:string;

begin
  if messagedlg('请确认要备份的年月份正确，继续吗？',   mtconfirmation,[mbyes,mbno],0)=mrno then exit;


 BMonth:=FormatDateTime('yyyy-MM',Bdate.date);
 EMonth:=FormatDateTime('yyyy-MM',Edate.date);
 NDate:=FormatDateTime('yyyyMMddhhmm',now)+'_'+copy(BMonth,1,4)+copy(BMonth,6,2) +'_'+copy(EMonth,1,4)+copy(EMonth,6,2);

 edt1.Text:=BMonth;
 edt2.Text:=EMonth;
 edt3.Text:=NDate;

 Lsql:='exec sp_BakData '''+BMonth+''','''+EMonth+''','''+NDate+''' ';

 dm.execsql(qrytemp,Lsql);
   ShowMessage('备份完成!');
end;

procedure TfrmMain.btn_ReInsertClick(Sender: TObject);
var
  Lsql:string;
begin
 try
    dm.con1.BeginTrans;
   if (NDate='' )  and (trim(edt1.Text)='') then
   begin
   ShowMessage('备份后不能关掉此窗口，现在不能重新导入备份数据， 请找相关人员协助！');
   edt1.Visible:=true;
   edt2.Visible:=True;
   edt3.Visible:=True;
   exit;
   end;

 if NDate<>'' then
  Lsql:='exec sp_ReInsert '''+BMonth+''','''+EMonth+''','''+NDate+''' '
 else
  Lsql:='exec sp_ReInsert '''+trim(edt1.Text)+''','''+trim(edt2.Text)+''','''+trim(edt3.Text)+''' ';
  //ShowMessage(Lsql);
   dm.execsql(qrytemp,Lsql);

 //更新v_onoffduty_report视图
  // dm.execsql(qry_UPdateView,qry_UPdateView.SQL.Text);

 dm.con1.CommitTrans;
 ShowMessage('插入完成!');
 except on e: exception do
   begin
   ShowMessage('插入错误：'+e.Message);
   dm.con1.RollbackTrans;
   Exit;
   end;
 end; 
end;

procedure TfrmMain.chk1Click(Sender: TObject);
begin
    if chk1.Checked  then
    begin
    NDate1.Visible :=true;
    NTime.Visible:=true;
    end
    else
    begin
    NDate1.Visible :=false;
    NTime.Visible:=false;
    end

end;

end.
