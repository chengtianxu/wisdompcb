unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DBGrids, StdCtrls, ExtCtrls, Buttons, Grids, DBGridEh, ComCtrls,
  Menus, DB, ADODB, ppProd, ppClass, ppReport, ppComm, ppRelatv, ppDB,
  ppDBPipe, ppCtrls, ppPrnabl, ppBands, ppCache, ppEndUsr;

type
  TForm1 = class(TForm)
    DBGridEh1: TDBGridEh;
    Panel1: TPanel;
    Label1: TLabel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    Edit1: TEdit;
    Splitter1: TSplitter;
    Panel2: TPanel;
    CheckBox0: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox1: TCheckBox;
    DBGrid1: TDBGrid;
    dtpk1: TDateTimePicker;
    dtpk2: TDateTimePicker;
    Label2: TLabel;
    Label3: TLabel;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    BitBtn6: TBitBtn;
    ppDB221: TppDBPipeline;
    ppDB222: TppDBPipeline;
    ppReport1: TppReport;
    ppDesigner1: TppDesigner;
    ppTitleBand1: TppTitleBand;
    ppHeaderBand1: TppHeaderBand;
    ppLabel2: TppLabel;
    ppDBText9: TppDBText;
    ppLabel5: TppLabel;
    ppDBText11: TppDBText;
    ppLabel3: TppLabel;
    ppLabel1: TppLabel;
    ppDBText8: TppDBText;
    ppLabel4: TppLabel;
    ppDBText10: TppDBText;
    ppLabel6: TppLabel;
    ppDBText12: TppDBText;
    ppDetailBand1: TppDetailBand;
    ppLine8: TppLine;
    ppFooterBand1: TppFooterBand;
    ppSummaryBand1: TppSummaryBand;
    ppLabel14: TppLabel;
    ppDBText13: TppDBText;
    ppLabel15: TppLabel;
    ppDBText14: TppDBText;
    ppLabel16: TppLabel;
    ppDBText15: TppDBText;
    ppLabel7: TppLabel;
    ppLabel8: TppLabel;
    ppLabel9: TppLabel;
    ppLabel10: TppLabel;
    ppLabel11: TppLabel;
    ppLabel12: TppLabel;
    ppLabel13: TppLabel;
    ppShape8: TppShape;
    ppDBText16: TppDBText;
    ppDBText17: TppDBText;
    ppDBText18: TppDBText;
    ppDBText19: TppDBText;
    ppDBText20: TppDBText;
    ppDBText21: TppDBText;
    ppDBText22: TppDBText;
    ppShape1: TppShape;
    ppShape2: TppShape;
    ppShape3: TppShape;
    ppShape4: TppShape;
    ppShape5: TppShape;
    ppShape6: TppShape;
    ppShape7: TppShape;
    ppShape9: TppShape;
    ppShape10: TppShape;
    ppShape11: TppShape;
    ppShape12: TppShape;
    ppShape13: TppShape;
    ppShape14: TppShape;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox0Click(Sender: TObject);
    procedure dtpk1Exit(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure N4Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure N5Click(Sender: TObject);
    procedure BitBtn6Click(Sender: TObject);
  private
    { Private declarations }
    PreColumn: TColumnEh;

    grid_colwith:integer;
    v_colwidth1,v_colwidth2: array of integer;
    function dateBeginOfMonth(D: TDateTime): TDateTime; //得到本月的第一一天2012.11.28
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo,common;  

{$R *.dfm}
//得到本月的第一一天2012.11.28
function TForm1.dateBeginOfMonth(D: TDateTime): TDateTime;
var
  Year, Month, Day: Word;
begin
  DecodeDate(D, Year, Month, Day);
  Result := EncodeDate(Year, Month, 1);
end;

procedure TForm1.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if column.Title.SortMarker =smDownEh then
  begin
   column.Title.SortMarker:=smUpEh;
   dm.ADS221.IndexFieldNames:=Column.FieldName;
  end
  else begin
   column.Title.SortMarker:=smDownEh;
   dm.ADS221.IndexFieldNames:=Column.FieldName+' DESC';
  end;

  if (column.ReadOnly) and (PreColumn.FieldName<>column.FieldName) then
  begin
    label1.Caption:=column.Title.Caption;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit1.SetFocus;
end;

procedure TForm1.FormShow(Sender: TObject);
var
 i:integer;
 curr_date:tdatetime;
begin
if  dm.ADOConnection1.Connected then
 begin
  curr_date := getsystem_date(dm.adoquery1,1);

  dtpk1.Date := dateBeginOfMonth(curr_date);
  dtpk2.Date := curr_date;
  dm.ADS221.Close;
  dm.ADS221.Parameters.ParamByName('dtpk1').Value := curr_date;
  dm.ADS221.Parameters.ParamByName('dtpk2').Value := curr_date+1;
  dm.ADS221.Open;
  dm.ADS222.Open;

  PreColumn := DBGridEH1.Columns[0];

  grid_colwith := dbgrid1.Width;
  setlength(v_colwidth1,DBGridEh1.FieldCount);
  setlength(v_colwidth2,dbgrid1.FieldCount);


  for i := 0 to high(v_colwidth1) do v_colwidth1[i] := DBGridEh1.Columns[i].Width;
  for i := 0 to high(v_colwidth2) do v_colwidth2[i] := dbgrid1.Columns[i].Width;
 end;
end;

procedure TForm1.FormResize(Sender: TObject);
var
 i:byte;
begin
for i:=low(v_colwidth1) to high(v_colwidth1) do
 DBGridEh1.Columns[i].Width:=v_colwidth1[i]+
  round((DBGridEh1.Width-grid_colwith)*v_colwidth1[i]/(grid_colwith-28));

for i:=low(v_colwidth2) to high(v_colwidth2) do
 dbgrid1.Columns[i].Width:=v_colwidth2[i]+
  round((dbgrid1.Width-grid_colwith)*v_colwidth2[i]/(grid_colwith-28));

end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
 close;
 application.Terminate;
end;

procedure TForm1.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then
    showmessage(dm.ADS221.CommandText);
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 v_rkey: integer;
begin
v_rkey := 0;
if not dm.ADS221.IsEmpty then  v_rkey := dm.ADS221rkey.Value;
 dm.ADS221.Close;
 dm.ADS221.Open;
if v_rkey > 0 then  dm.ADS221.Locate('rkey',v_rkey,[]);
end;

procedure TForm1.BitBtn4Click(Sender: TObject);
begin
Export_dbGridEH_to_Excel(self.DBGridEh1,self.Caption);
end;

procedure TForm1.Edit1Change(Sender: TObject);
begin
 if trim(Edit1.text)<>'' then
   dm.ADS221.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
 else dm.ADS221.filter := '';
end;

procedure TForm1.CheckBox0Click(Sender: TObject);
begin
dm.ADS221.Close;
if CheckBox0.Checked then
 dm.ADS221.Parameters[2].Value:=9
else
 dm.ADS221.Parameters[2].Value:=0;

if checkbox1.Checked then
 dm.ADS221.Parameters[3].Value:=9
else
 dm.ADS221.Parameters[3].Value:=1;

if checkbox2.Checked then
 dm.ADS221.Parameters[4].Value:=9
else
 dm.ADS221.Parameters[4].Value:=2;

if checkbox3.Checked then
 dm.ADS221.Parameters[5].Value:=9
else
 dm.ADS221.Parameters[5].Value:=3;

dm.ADS221.Open;
end;

procedure TForm1.dtpk1Exit(Sender: TObject);
begin
 dm.ADS221.Close;
 dm.ADS221.Parameters[0].Value := dtpk1.Date;
 dm.ADS221.Parameters[1].Value := dtpk2.Date+1;
 dm.ADS221.Open;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
n1.Enabled:=dm.ADS221status.Value=1;
n4.Enabled:=n1.Enabled;
n2.Enabled:=dm.ADS221status.Value=2;
n5.Enabled:=n2.Enabled;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Text:='select status from data0221 where rkey='+dm.ADS221rkey.AsString+
             ' and status='+dm.ADS221status.AsString;
  open;
 end;
if dm.ADOQuery1.IsEmpty then
 ShowMsg('出仓单号状态发生变化,操作失败!',1)
else
 try
 dm.ADOConnection1.BeginTrans;
 dm.ADS221.Edit;
 dm.ADS221auth_empl_ptr.Value := strtoint(user_ptr);
 dm.ADS221auth_date.Value := getsystem_date(dm.ADOQuery1,0);
 dm.ADS221status.Value := 2;
 dm.ADS221.Post;
 with dm.adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0220');
   sql.Add('set quan_alloc=quan_alloc-data0222.QUANTITY,'); //更新220库存
   sql.Add('Quan_ON_HAND=Quan_ON_HAND-data0222.QUANTITY');
   sql.Add('from data0220 inner join data0222');
   sql.Add('on data0220.rkey=data0222.bach_ptr');
   sql.Add('where data0222.head_ptr='+dm.ADS221rkey.AsString);
   ExecSQL;
  end;

  dm.ADOConnection1.CommitTrans;
  if Msg_Dlg_Ask('审核出仓操作成功,是否打印报表','打印确认',2) then
//   self.ppReport1.Print;
  N5Click(Self);
  BitBtn3Click(nil);
 except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
 end;
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Text:='select status from data0221 where rkey='+dm.ADS221rkey.AsString+
             ' and status='+dm.ADS221status.AsString;
  open;
 end;
if dm.ADOQuery1.IsEmpty then
 ShowMsg('出仓单号状态发生变化,操作失败!',1)
else
 try
 dm.ADOConnection1.BeginTrans;
 dm.ADS221.Edit;
 dm.ADS221auth_empl_ptr.AsVariant :=null;
 dm.ADS221auth_date.AsVariant := null;
 dm.ADS221status.Value := 1;
 dm.ADS221.Post;
 with dm.adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('update data0220');
   sql.Add('set quan_alloc=quan_alloc+data0220.QUANTITY,'); //更新220库存
   sql.Add('Quan_ON_HAND=Quan_ON_HAND+data0220.QUANTITY');
   sql.Add('from data0220 inner join data0222');
   sql.Add('on data0220.rkey=data0222.bach_ptr');
   sql.Add('where data0222.head_ptr='+dm.ADS221rkey.AsString);
   ExecSQL;
  end;

  dm.ADOConnection1.CommitTrans;
  showmsg('取消审核操作成功',1);
  BitBtn3Click(nil);
 except
  on E: Exception do
   begin
    dm.ADOConnection1.RollbackTrans;
    messagedlg(E.Message,mterror,[mbcancel],0);
   end;
 end;
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败请联系管理员!',1);
    application.Terminate;
   end;
  self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';

{user_ptr:='3';
vprev:='4'; }
end;

procedure TForm1.N4Click(Sender: TObject);
var
 str:string;
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;
// str:=InputBox('退回原因', '请输入退回原因', '');

if inputquery('退回原因','请输入退回原因:',str) then
if trim(str) = '' then
 ShowMsg('退回原因为空操作不成功',1)
else
begin
with dm.ADOQuery1 do
 begin
  close;
  sql.Clear;
  sql.Text:='select status from data0221 where rkey='+dm.ADS221rkey.AsString+
             ' and status='+dm.ADS221status.AsString;
  open;
 end;
if dm.ADOQuery1.IsEmpty then
 ShowMsg('出仓单号状态发生变化,操作失败!',1)
else
 begin
  dm.ADS221.Edit;
  dm.ADS221auth_empl_ptr.Value := strtoint(user_ptr);
  dm.ADS221auth_date.Value := getsystem_date(dm.ADOQuery1,0);
  dm.ADS221status.Value := 3;
  dm.ADS221reference.Value := str;
  dm.ADS221.Post;
  BitBtn3Click(nil);
 end;
end;
end;

procedure TForm1.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
 if (dm.ADS221status.Value = 0) then
  DBGridEh1.Canvas.Font.Color := cllime
 else
 if (dm.ADS221status.Value = 3) then
  DBGridEh1.Canvas.Font.Color := clRed;

  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.N5Click(Sender: TObject);
var i:Integer;
begin
//self.ppReport1.Print;
//R:\NIERP\REPORT\zdl_getout.rtm
    DM.ADS222.Close;
    dm.ads222.Parameters.ParamByName('rkey').Value:=dm.ADS221rkey.AsString;
    DM.ADS222.Open;
    ppReport1.Reset;
    ppReport1.Template.FileName :=
      stringReplace(UpperCase(GetCurrentDir),'EXEC','NIERP\REPORT\',[rfReplaceAll])+
        'zdl_getout1.rtm';
    ppReport1.Template.LoadFromFile;

//    ppSubReport1.Visible := b_print_impedance;
//    ppSubReport2.Visible := b_print_Layers;
    ppreport1.SaveAsTemplate:=false;
    ppreport1.Print;

end;

procedure TForm1.BitBtn6Click(Sender: TObject);
begin
 if (strtoint(vprev)=1) or (strtoint(vprev)=3) then
 begin
  messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
  exit;
 end;
ppDesigner1.ShowModal;
end;

end.
