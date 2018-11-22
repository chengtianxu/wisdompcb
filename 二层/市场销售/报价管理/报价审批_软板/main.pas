unit main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, ExtCtrls, Buttons, Grids, DBGrids, Menus;

type
  TForm1 = class(TForm)
    Panel1: TPanel;
    RadioGroup1: TRadioGroup;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    DBGrid1: TDBGrid;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    N6: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure FormShow(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure N6Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N5Click(Sender: TObject);
    procedure DBGrid1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
   sql_text:string;
   OldGridWnd : TWndMethod;
   procedure NewGridWnd (var Message : TMessage);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses damo, auth_info,common, quote_detail;

{$R *.dfm}
procedure TForm1.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
 begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
     DBGrid1.DataSource.DataSet.MoveBy(1)
   else
     DBGrid1.DataSource.DataSet.MoveBy(-1)
 end
 else
   OldGridWnd(Message);
end;

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
application.Terminate;
end;

procedure TForm1.BitBtn3Click(Sender: TObject);
var
 rkey:integer;
begin
rkey:=dm.ads85rKEY.Value;
dm.ADS85.Close;
dm.ADS85.Open;
if rkey>0 then dm.ADS85.Locate('rkey',rkey,[]);
end;

procedure TForm1.DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
  DataCol: Integer; Column: TColumn; State: TGridDrawState);
begin
 if (dm.ADS85auth_date.AsVariant=null) then
  DBGrid1.Canvas.Font.Color := cllime
 else
  if (dm.ADS85AUDITED_STATUS.Value=4) then
   DBGrid1.Canvas.Font.Color := clred;
 DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

procedure TForm1.FormShow(Sender: TObject);
begin
if dm.ADOConnection1.Connected then
 begin
  with dm.adoquery1 do
  begin
   close;
   sql.Clear;
   sql.Add('select QTE_CONTROL1 from data0192');
   open;
   dm.qte_type := fieldbyname('QTE_CONTROL1').AsInteger;
  end;
  sql_text:=dm.ADS85.CommandText;
  RadioGroup1Click(Sender);
 end;
end;

procedure TForm1.RadioGroup1Click(Sender: TObject);
begin
dm.ADS85.Close;
dm.ADS85.Parameters[0].Value:=strtoint(rkey73);
if radiogroup1.ItemIndex=0 then
 dm.ADS85.CommandText:=sql_text+' and Data0274.auth_flag = ''Y'''
else
 dm.ADS85.CommandText:=sql_text;
dm.ADS85.Open;
end;

procedure TForm1.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  showmessage(dm.aDs85.CommandText);
end;

procedure TForm1.N6Click(Sender: TObject);
begin
 application.CreateForm(tform_authinfo,form_authinfo);
 dm.ads274.Open;
 Form_authinfo.ShowModal;
 dm.ads274.Close;
 form_authinfo.Free;
end;

procedure TForm1.PopupMenu1Popup(Sender: TObject);
begin
if dm.ADS85.IsEmpty then
 begin
  n1.Enabled:=false;
  n3.Enabled:=false;
  n2.Enabled:=false;
  n5.Enabled:=false;
  n6.Enabled:=false;

 end
else
begin
  n5.Enabled:=true;
  n6.Enabled:=true;
if (dm.ADS85auth_date.AsVariant=null) then
 begin
  n1.Enabled:=true;
  n2.Enabled:=false;
  n3.Enabled:=true;
 end
else
 begin
  n1.Enabled:=false;
  n2.Enabled:=true;
  n3.Enabled:=false;
 end;
end;
end;

procedure TForm1.N1Click(Sender: TObject);
begin
 if dm.ADS85auth_flag.Value='Y' then
  try
   dm.ADOConnection1.BeginTrans;
   dm.ADS85.Edit;
   dm.ADS85auth_flag.Value:='N';                 //78
   dm.ADS85auth_date.Value := getsystem_date(dm.adoquery1,0);   // 授权日期服务器时间78

   dm.ads274.Close;
   dm.ads274.Open;

    while not dm.ads274.Eof do
    begin
     if dm.ads274ranking.Value-dm.Ads85ranking.Value = 1 then
      begin               //给下一个审批用户赋值
       dm.ads274.Edit;
       dm.ads274auth_flag.Value:='Y';
       dm.ads274.Post;
       break;
      end
     else
      if dm.ads274.RecNo=dm.ads274.RecordCount then//如果是最后一条记录
       dm.Ads85audited_status.Value := 3;//表示报价已经完成审批
     dm.ads274.Next;
    end;
     dm.ADS85.Post;
     dm.ADOConnection1.CommitTrans;
   except
    dm.ADOConnection1.RollbackTrans;
    messagedlg('审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
    dm.ADs85.Close;
    dm.ADs85.Open;
   end
  else
   messagedlg('审批不成功，当前审批人不是您！',mterror,[mbcancel],0);
end;

procedure TForm1.N2Click(Sender: TObject);
begin
 try                  //如果已全部审批那么变成待审批状态
  dm.ADOConnection1.BeginTrans;
  dm.ADs85.Edit;
  dm.ADs85auth_date.AsVariant := null;   // 取消审批
  dm.ADs85auth_flag.Value:='Y';
  if dm.ADs85audited_status.Value = 3 then
   dm.ADs85audited_STATUS.Value := 1;

   dm.ADs85.Post;

   dm.ads274.Close;
   dm.ads274.Open;
   while not dm.ads274.Eof do
    begin
     if dm.ads274ranking.Value-dm.Ads85ranking.Value = 1 then
      begin               //给下一个审批用户赋值
       dm.ads274.Edit;
       dm.ads274auth_flag.Value:='N';
       dm.ads274.Post;
       break;
      end;
     dm.ads274.Next;
    end;
    dm.ADOConnection1.CommitTrans;
 except
    dm.ADOConnection1.RollbackTrans;
    messagedlg('取消审批操作不成，请退出后再来一次',mtinformation,[mbok],0);
    dm.ADs85.Close;
    dm.ADs85.Open;
 end;

 end;

procedure TForm1.N3Click(Sender: TObject);
var
 str:string;
begin
if messagedlg('退回报价员操作是不可逆操作,你确定吗?',mtconfirmation,[mbyes,mbno],0)=mryes then
begin
 str := InputBox(dm.ADS85TNUMBER.Value,'退回原因','');

 if trim(str)<>'' then
 begin
 dm.ADS85.Edit;
 dm.ADS85AUDITED_STATUS.Value:=4;
 dm.ADS85apprv_date.Value := getsystem_date(dm.adoquery1,0);//退回日期
 openquery(dm.ADOQuery1,'select EMPLOYEE_PTR from data0073 where rkey='+
                         rkey73);
 dm.ADS85APPRV_BY_PTR.Value:=dm.ADOQuery1.FieldValues['EMPLOYEE_PTR'];
 dm.ADS85cust_add2.Value:=str;
 dm.ADS85.Post;
 dm.ADS85.Close;
 dm.ADS85.Open;
 end
 else
 messagedlg('退回原因为空，退回操作不成',mtinformation,[mbok],0);
end;
end;

procedure TForm1.N5Click(Sender: TObject);
begin
  try
    form2:=tform2.Create(application);
    dm.ADSA85.Close;
    dm.ADSa85.Parameters[0].Value:=dm.ADS85rkey.Value;
    dm.ADSa85.Open;
    with form2 do
    begin
      bitbtn1.Enabled:=false;
      dbedit1.ReadOnly:=true;
      dbedit2.Enabled:=false;
      dbedit3.Enabled:=false;
      dbedit4.Enabled:=false;
      dbedit5.Enabled:=false;
      dbedit6.Enabled:=false;
      dbedit7.Enabled:=false;
      dbedit8.Enabled:=false;
      dbedit9.Enabled:=false;
      dbedit10.Enabled:=false;
      dbedit11.Enabled:=false;
      dbedit12.Enabled:=false;
      dbedit13.Enabled:=false;
      dbedit15.Enabled:=false;
      dbedit16.Enabled:=false;
      dbedit31.Enabled:=false;
      dbedit32.Enabled:=false;
      dbmemo1.Enabled:=false;
      dbradiogroup1.Enabled:=false;
      edit1.Enabled:=false;
      edit2.Enabled:=false;
      edit3.Enabled:=false;
      edit4.Enabled:=false;
      edit5.Enabled:=false;
      combobox3.Enabled:=false;
      bitbtn3.Enabled:=false;
      bitbtn4.Enabled:=false;
      bitbtn5.Enabled:=false;
      bitbtn7.Enabled:=false;
      bitbtn8.Enabled:=false;
      button1.Enabled:=false;
      speedbutton1.Enabled:=false;
      speedbutton2.Enabled:=false;
      dbmemo2.Enabled:=false;
      stringgrid1.Enabled:=false;
    end;

    form2.ShowModal;
    dm.ADSA85.Close;
    DM.ads432.Close;
    dm.ads431.Close;
    dm.ads511.Close;
    dm.ads278.Close;
  finally
    form2.Free;
  end;
end;

procedure TForm1.DBGrid1DblClick(Sender: TObject);
begin
if not dm.ADS85.IsEmpty then n5click(sender);
end;

procedure TForm1.FormCreate(Sender: TObject);
begin
  if not app_init_2(dm.ADOConnection1) then
   begin
    showmsg('程序起动失败,请联系管理员!',1);
    application.Terminate;
   end;
  self.caption:=application.Title;

// vprev:='4';
// rkey73:='1415';
// dm.ADOConnection1.Open;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
 OldGridWnd := DBGrid1.WindowProc;
 DBGrid1.WindowProc := NewGridWnd;  
end;

end.
