unit Main_Unit2;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MainTem_Unit1, Menus, Grids, DBGridEh, StdCtrls, Buttons,
  ExtCtrls, DB, ADODB,DateUtils;

type
  TMainTemForm2 = class(TMainTemForm1)
    Label1: TLabel;
    Edit1: TEdit;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure Temp_DBGridEh1TitleBtnClick(Sender: TObject; ACol: Integer;
                                           Column: TColumnEh);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure Temp_DBGridEh1DblClick(Sender: TObject);
  private
    PreColumn: TColumnEh;
    field_name:string;

    hMapFile: THandle;
    MapFilePointer: Pointer;
    vs3:string;
    Vdtpk3Date : tdate;
    Vdtpk4Date :tdate;
    procedure MenuItemClick(Sender: TObject);

  public
    { Public declarations }
    
  end;

var
  MainTemForm2: TMainTemForm2;

implementation

uses
   DMUnit1,IF_Unit1,common,Frm_QrySum_u;
{$R *.dfm}

procedure TMainTemForm2.FormShow(Sender: TObject);
var
  vn2:array of TMenuItem;
  i,n:integer;
begin
  inherited;

  n:=Temp_DBGridEh1.Columns.Count-1  ;

  setlength(vn2,n+1);
  for i:=0 to n do
  begin
    vn2[i]:=TMenuItem.Create(PopupMenu2) ;
    vn2[i].Name :=trim(Temp_DBGridEh1.Name)+'_'+inttostr(i);
    vn2[i].Caption := Temp_DBGridEh1.Columns[i].Title.Caption;
    vn2[i].Enabled:=not ((i in [16,17,30]) and (strtoint(common.vprev)<=2)  );
    vn2[i].OnClick := MenuItemClick;
    if (i in [16,17,30]) then
      vn2[i].Checked := not (strtoint(common.vprev)<=2)
    ELSE
      vn2[i].Checked := Temp_DBGridEh1.Columns[i].Visible ;
    PopupMenu2.Items.Add(vn2[i]) ;
  end;

  field_name := Temp_DBGridEh1.Columns[0].FieldName;
  PreColumn := Temp_DBGridEh1.Columns[0];

end;

procedure TMainTemForm2.MenuItemClick(Sender: TObject);
var
 i:byte;
begin
(sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
if (sender as tmenuItem).Checked then
 begin
  for i:=0 to Temp_DBGridEh1.FieldCount-1 do
  if Temp_DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    Temp_DBGridEh1.Columns[i].Visible:=true;
    break;
   end;
 end
else
 begin
  for i:=0 to Temp_DBGridEh1.FieldCount-1 do
  if Temp_DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
   begin
    Temp_DBGridEh1.Columns[i].Visible:=false;
    break;
   end;
 end;
end;


procedure TMainTemForm2.BitBtn5Click(Sender: TObject);
begin
  inherited;
  popupmenu2.Popup(mouse.CursorPos.x,mouse.CursorPos.y);

end;

procedure TMainTemForm2.Temp_DBGridEh1TitleBtnClick(Sender: TObject;
  ACol: Integer; Column: TColumnEh);
begin
  inherited;
  if not Temp_DBGridEh1.DataSource.DataSet.Active then exit;
  //如果只有一条记录不存在排序的问题
  if Temp_DBGridEh1.DataSource.DataSet.RecordCount <= 1 then exit;

  if Temp_DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType
  in [ftDate, ftTime, ftDateTime] then exit;
     
  if (field_name <> column.FieldName) then
  begin
    label1.Caption := column.Title.Caption ;
    field_name := column.FieldName ;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace ;
    Column.Title.Color := clred ;
    PreColumn := column ;
    Edit1Change(Edit1);
  end else
    edit1.SetFocus;

  // self.TitleBtnSort1(sender,acol,column,adoquery,1)
  TitleBtnSort1(sender,acol,column,dm.wzcx98_1);

end;

procedure TMainTemForm2.BitBtn2Click(Sender: TObject);
begin
  inherited;
  self.DbgridEHToExcel2(Temp_DBGridEh1,'成品退货');

end;

procedure TMainTemForm2.BitBtn3Click(Sender: TObject);
//var
//  n,i:integer;
begin
  inherited;
  PopupMenu1.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
  {If_Form1:=TIf_Form1.Create(application) ;
  try
    //If_Form1.ListBox2Click(sender);
      If_Form1.DateTimePicker1.Date := Vdtpk3Date ;
      If_Form1.DateTimePicker2.Date := Vdtpk4Date ;

    if If_Form1.ShowModal=mrok then
    begin
       Vdtpk3Date := If_Form1.DateTimePicker1.Date ;
       Vdtpk4Date := If_Form1.DateTimePicker2.Date;
       If_Form1.Hide;
       if dm.wzcx98_1.Active then dm.wzcx98_1.Close;

       dm.wzcx98_1.Parameters.ParamValues['@wher1']:=If_Form1.parametersvalue1;
       dm.wzcx98_1.Parameters.ParamValues['@wher2']:=If_Form1.parametersvalue1;
       dm.wzcx98_1.Parameters.ParamValues['@wher3']:=If_Form1.parametersvalue2;
       dm.wzcx98_1.Parameters.ParamValues['@wher4']:=If_Form1.parametersvalue3;
       dm.wzcx98_1.Parameters.ParamValues['@wher5']:=If_Form1.parametersvalue4;
       dm.wzcx98_1.Parameters.ParamValues['@wher6']:=If_Form1.parametersvalue5;
       dm.wzcx98_1.Parameters.ParamValues['@wher7']:=If_Form1.parametersvalue7;
       dm.wzcx98_1.Parameters.ParamValues['@wher8']:=If_Form1.parametersvalue8;
       dm.wzcx98_1.Parameters.ParamValues['@ISSUE_DATE1']:=datetostr(If_Form1.DateTimePicker1.Date)+' 00:00:00';
       dm.wzcx98_1.Parameters.ParamValues['@ISSUE_DATE2']:=datetostr(If_Form1.DateTimePicker2.Date)+' 23:59:59';
       dm.wzcx98_1.Parameters.ParamValues['@finished']:= -1 ; //取消不用了这个参数了// If_Form1.RadioGroup1.ItemIndex;
       dm.wzcx98_1.Parameters.ParamValues['@so_tp']:=If_Form1.RadioGroup2.ItemIndex;
       dm.wzcx98_1.Parameters.ParamValues['@vrkey278']:=1;  //取消不用了这个参数了
       //dm.wzcx96_1.Prepared;
       //showmessage(if_form1.parametersvalue1);
       dm.wzcx98_1.Open;

       Temp_DBGridEh1.SetFocus;
    end;
  finally
    //if dm.wzcx98_11.Active then dm.wzcx98_11.Close;
    If_Form1.Free;
  end;}

end;

procedure TMainTemForm2.BitBtn4Click(Sender: TObject);
var
  s,s2,s3:string;
  b2:boolean;
  V2: Variant;
begin
  inherited;
 try
   if not Temp_DBGridEh1.DataSource.DataSet.Active then exit;
   if Temp_DBGridEh1.DataSource.DataSet.RecordCount <=1 then exit;
   if self.vColumn1 = nil then
       begin
         s :='RMA_NUMBER';
         s3 := '退货单号：  ';
       end
       else
       begin
         s := self.vColumn1.FieldName;
         s3 := self.vColumn1.Title.Caption+':             '  ;
       end;
   //vColumn1.Field.DataType =
   //ftDate, ftTime, ftDateTime

   s2:=inputbox('输入--'+s3, s3, vs3);
   vs3 :=s2 ;
   v2:=vs3;
   if s2='' then exit;
   //DBGridEH1.DataSource.DataSet.Lookup()
   b2 := Temp_DBGridEh1.DataSource.DataSet.Locate(s,v2,[]);
   if not b2 then showmessage('没有找到您要求的记录！！请确认是否输入正确');
 except
 end;

end;

procedure TMainTemForm2.FormCreate(Sender: TObject);
var
 ZAppName: array[0..127] of char;
 s,title_name:string;
 Found: HWND;
 vprog:pchar;
begin
  inherited;

  if DM.ADOConnection1.Connected then
    begin
      showmessage('程序处于开发模式下运行，请在发布程序前先断开数据库连接后编译！');
      user_ptr := '1';
      vprev := '2';
    end
  else
    if not App_Init_2(DM.ADOConnection1) then
    begin
      ShowMsg('程序起动失败请联系管理员',1);
      application.Terminate;
    end;
  Caption := application.Title;

  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  Vdtpk3Date := EncodeDate(YearOf(now()),MonthOf(now()),1);
  Vdtpk4Date := EncodeDate(YearOf(now()),MonthOf(now()),dayof(now()));


end;

procedure TMainTemForm2.Edit1Change(Sender: TObject);
begin
  inherited;
  if Temp_DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if Temp_DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if Temp_DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        Temp_DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if Temp_DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        Temp_DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      Temp_DBGridEh1.DataSource.DataSet.Filter:='';
  end;
end;

procedure TMainTemForm2.N1Click(Sender: TObject);
begin
  inherited;
  If_Form1:=TIf_Form1.Create(application) ;
  try
    //If_Form1.ListBox2Click(sender);
      If_Form1.DateTimePicker1.Date := Vdtpk3Date ;
      If_Form1.DateTimePicker2.Date := Vdtpk4Date ;

    if If_Form1.ShowModal=mrok then
    begin
       Vdtpk3Date := If_Form1.DateTimePicker1.Date ;
       Vdtpk4Date := If_Form1.DateTimePicker2.Date;
       If_Form1.Hide;
       if dm.wzcx98_1.Active then dm.wzcx98_1.Close;

       dm.wzcx98_1.Parameters.ParamValues['@wher1']:=If_Form1.parametersvalue1;
       dm.wzcx98_1.Parameters.ParamValues['@wher2']:=If_Form1.parametersvalue1;
       dm.wzcx98_1.Parameters.ParamValues['@wher3']:=If_Form1.parametersvalue2;
       dm.wzcx98_1.Parameters.ParamValues['@wher4']:=If_Form1.parametersvalue3;
       dm.wzcx98_1.Parameters.ParamValues['@wher5']:=If_Form1.parametersvalue4;
       dm.wzcx98_1.Parameters.ParamValues['@wher6']:=If_Form1.parametersvalue5;
       dm.wzcx98_1.Parameters.ParamValues['@wher7']:=If_Form1.parametersvalue7;
       dm.wzcx98_1.Parameters.ParamValues['@wher8']:=If_Form1.parametersvalue8;
       dm.wzcx98_1.Parameters.ParamValues['@ISSUE_DATE1']:=datetostr(If_Form1.DateTimePicker1.Date)+' 00:00:00';
       dm.wzcx98_1.Parameters.ParamValues['@ISSUE_DATE2']:=datetostr(If_Form1.DateTimePicker2.Date)+' 23:59:59';
       dm.wzcx98_1.Parameters.ParamValues['@finished']:= -1 ; //取消不用了这个参数了// If_Form1.RadioGroup1.ItemIndex;
       dm.wzcx98_1.Parameters.ParamValues['@so_tp']:=If_Form1.RadioGroup2.ItemIndex;
       dm.wzcx98_1.Parameters.ParamValues['@vrkey278']:=1;  //取消不用了这个参数了
       dm.wzcx98_1.Open;

       Temp_DBGridEh1.SetFocus;
    end;
  finally
    //if dm.wzcx98_11.Active then dm.wzcx98_11.Close;
    If_Form1.Free;
  end;
end;

procedure TMainTemForm2.N2Click(Sender: TObject);
begin
  inherited;
  Frm_QrySum:=TFrm_QrySum.Create(nil);
  try
    Frm_QrySum.dtpk1.Date := Vdtpk3Date ;
    Frm_QrySum.dtpk2.Date := Vdtpk4Date ;
    Frm_QrySum.ShowModal;
  finally
    Frm_QrySum.Free;
  end;
end;

procedure TMainTemForm2.Temp_DBGridEh1DblClick(Sender: TObject);
begin
  if not DM.wzcx98_1.IsEmpty then
  ShowMessage(DM.wzcx98_1.FieldValues['remark']);

end;

end.
