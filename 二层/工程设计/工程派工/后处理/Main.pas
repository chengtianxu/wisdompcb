unit Main;
                       
interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, Buttons, ExtCtrls,DB, Menus;

type
  TForm_main = class(TForm)
    Panel5: TPanel;
    Label1: TLabel;
    lbl1: TLabel;
    BitBtn2: TBitBtn;
    BitBtn5: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn1: TBitBtn;
    Edit1: TEdit;
    DBGridEh1: TDBGridEh;
    GroupBox1: TGroupBox;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    PopupMenu2: TPopupMenu;
    btnField: TBitBtn;
    N2: TMenuItem;
    procedure BitBtn5Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure btnFieldClick(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);


  private
    { Private declarations }
    Sqlstr:string;
    strSQLTxt:string;
    StartDate,EndDate:TDatetime;
    Rk419:Integer;
    PreColumn: TColumnEh;
    field_name:string;
    
    sWhereIN:string;
    function GetCheckBox():string;
    procedure item_click(Sender: TObject);
  public
    { Public declarations }
  end;

var
  Form_main: TForm_main;

implementation

uses  common,DAMO, Query;

{$R *.dfm}
function TForm_main.GetCheckBox():string;
var sTp:string;
    i:Integer;
begin
  sTp:='(100';
  for i:=1 to 3 do
   if TCheckBox(FindComponent('checkBox'+inttostr(i))).Checked then
     sTp:=sTp+','+inttostr(TCheckBox(GroupBox1.Controls[i]).Tag);
   sTp:=sTp+')';                                      
  Result:=' and DATA0538.hcl_status in '+stp;
end;

procedure TForm_main.BitBtn5Click(Sender: TObject);
begin
close;
application.Terminate;
end;



procedure TForm_main.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if key=45 then abort; //insert键
 if (key=46) and (ssCtrl in shift) then abort;//删除记录
  if (ssAlt in Shift)  and  (Key=86) then
  showmessage(DM.Ado538.SQL.Text);
end;

procedure TForm_main.FormShow(Sender: TObject);
   var
  i:Integer;
  item:TMenuItem;
begin
  if FrmQuery=nil then  FrmQuery:=TFrmQuery.Create(Application);
  strSQLTxt:=dm.Ado538.SQL.Text;
  StartDate:=getsystem_date(DM.tmp,1)-100;
  EndDate:=getsystem_date(DM.tmp,1);
  sWhereIN:=GetCheckBox();
  FrmQuery.DateTimePicker3.Date:=StartDate;
  FrmQuery.DateTimePicker5.Date:=EndDate;
//  with DM.tmp do
//  begin
//    Close;
//    SQL.Text:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
//    Open;
//    if not IsEmpty then
//      Rk419:=FieldByName('rkey').AsInteger
//    else
//      Rk419:=-1;//2570;
//  end;
    DM.Ado538.Close;
    DM.Ado538.SQL.Clear;
    DM.Ado538.SQL.Text:=strSQLTxt+' where data0538.if_hcl=1 '+sWhereIN+' and DATA0538.QAE_END_DATE>='''+formatdatetime('yyyy-mm-dd ',StartDate)+
                         ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',EndDate)+''' order by DATA0538.curr_date desc';
    DM.Ado538.Prepared;
    DM.Ado538.Open;

 begin
  PreColumn := DBGridEh1.Columns[0];
  for i:=1 to DBGrideh1.Columns.Count do
   begin
    item := TmenuItem.Create(self) ;
    item.Caption := DBGrideh1.Columns[i-1].Title.Caption ;
    item.Checked := DBGrideh1.Columns[i-1].Visible ;
    item.OnClick := item_click ;
    self.PopupMenu2.Items.Add(item) ;
   end;

  field_name := DBGridEh1.Columns[1].FieldName;
  PreColumn := DBGridEh1.Columns[0] ;
  PreColumn.Title.Color := clred ;
 end;
end;
procedure TForm_main.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;

  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    dm.Ado538.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    dm.Ado538.Sort:= Column.FieldName + ' DESC';
  end;

  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
  if (PreColumn.FieldName<>column.FieldName) and (column.ReadOnly) then
  begin
    label1.Caption:=column.Title.Caption + ':';
    self.field_name:=column.FieldName;
    edit1.SetFocus;
    PreColumn.Title.Color := clBtnFace;
     Column.Title.Color := clred;
    PreColumn := column;
  end
  else
    edit1.SetFocus;
end;

procedure TForm_main.Edit1Change(Sender: TObject);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if DBGridEh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        DBGridEh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      DBGridEh1.DataSource.DataSet.Filter:='';
  end;
  lbl1.Caption := IntToStr(DBGridEh1.DataSource.DataSet.RecordCount);
end;

procedure TForm_main.BitBtn4Click(Sender: TObject);
begin
  Export_dbGridEH_to_Excel(DBGridEh1,self.Caption) ;
end;

procedure TForm_main.BitBtn2Click(Sender: TObject);
var strtemp:string;
begin
//  if DM.Ado538.IsEmpty then exit;

  strtemp := dm.Ado538MANU_PART_NUMBER.AsString;
  sWhereIN:=GetCheckBox();
  DM.Ado538.Close;
  DM.Ado538.SQL.Clear;
  DM.Ado538.SQL.Text:=strSQLTxt+' where data0538.if_hcl=1 '+sWhereIN+' and DATA0538.curr_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
                       ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+''' order by DATA0538.curr_date desc';
  DM.Ado538.Prepared;
  //showmessage(dm.Ado538.SQL.Text);
  DM.Ado538.Open;
  
  DM.Ado538.Locate('MANU_PART_NUMBER',strtemp,[]);
end;


procedure TForm_main.FormCreate(Sender: TObject);
begin
   if not app_init_2(DM.ADOConnection1) then
  begin
   showmsg('程序起动失败请联系管理员!',1);
   application.Terminate;
  end;
 self.Caption:=application.Title;
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
//  with DM.tmp do
//  begin
//    Close;
//    sql.Clear;
//    SQL.Add('select rkey from data0073 where EMPLOYEE_PTR='+user_ptr);
//    Open;
//  end;
//  rkey73:=DM.tmp.fieldbyname('rkey').AsString;
//  rkey73:='2141';
//  user_ptr:='2217';
//  vprev:='4';


  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
end;



procedure TForm_main.BitBtn1Click(Sender: TObject);
var i,j,iNo:integer;
    strText,sTemp:string;
begin
  if StartDate > 100 then
    FrmQuery.DateTimePicker3.Date:= StartDate
  else
    FrmQuery.DateTimePicker3.Date:=getsystem_date(DM.tmp,1)-1;
  if EndDate > 100 then
    FrmQuery.DateTimePicker5.Date:= EndDate
  else
    FrmQuery.DateTimePicker5.Date:=getsystem_date(DM.tmp,1);

  sWhereIN:=GetCheckBox();
  Sqlstr:='';
  if FrmQuery.ShowModal=mrok then
  begin
    screen.Cursor:=crHourGlass;

    for i:=1 to FrmQuery.SGrid1.RowCount-2 do
    if FrmQuery.sgrid1.Cells[2,i]<> '' then Sqlstr:=sqlstr+FrmQuery.sgrid1.Cells[2,i];
    try
      DM.Ado538.DisableControls;
      DM.Ado538.Close;
      DM.Ado538.SQL.Clear;
      DM.Ado538.SQL.Text:=strSQLTxt+' where data0538.if_hcl=1 '+Sqlstr+sWhereIN+' and DATA0538.curr_date>='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
                           ''' and DATA0538.curr_date<='''+formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+''' order by DATA0538.curr_date desc';
//      StartDate:=FrmQuery.DateTimePicker3.Date;
//      EndDate:=FrmQuery.DateTimePicker5.Date;
      DM.Ado538.Prepared;
      DM.Ado538.Open;
    finally
      DM.Ado538.EnableControls;
    end;
    screen.Cursor:=crDefault;
  end;
end;




procedure TForm_main.CheckBox1Click(Sender: TObject);
begin
  sWhereIN:=GetCheckBox();
  DM.Ado538.Close;
  DM.Ado538.SQL.Clear;
  DM.Ado538.SQL.Text:=strSQLTxt+
    '  where data0538.if_hcl=1 and data0538. STATUS=8 '+sWhereIN+
    ' and DATA0538.curr_date>='''
    +formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker3.Date)+
    ''' and DATA0538.curr_date<='''
    +formatdatetime('yyyy-mm-dd ',FrmQuery.DateTimePicker5.Date)+
    ''' order by DATA0538.curr_date desc';
  DM.Ado538.Prepared;
  DM.Ado538.Open;
end;

procedure TForm_main.N1Click(Sender: TObject);
  begin
    if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
  begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
  end;
   
  begin
    dm.Ado538.Edit;
    dm.Ado538HCL_STATUS.Value :=1;
    DM.Ado538HCL_USER_PTR.Value := strtoint(user_ptr);
    dm.tmp.SQL.Clear;
    dm.tmp.SQL.Text := 'select getdate() as t';
    dm.tmp.ExecSQL;
    dm.tmp.Open;
    dm.Ado538HCL_DATE.Value := dm.tmp.fieldbyname('t').AsDateTime;
    dm.tmp.Close;
  dm.Ado538.Post;
  dm.Ado538.UpdateBatch();
  BitBtn2.Click;

  end;

 end;

procedure TForm_main.PopupMenu1Popup(Sender: TObject);
begin
   N1.Enabled := False;
   N2.Enabled := False;
   IF DM.Ado538HCL_STATUS.AsInteger =0 then N1.Enabled := true;
   IF DM.Ado538HCL_STATUS.AsInteger = 1 then N2.Enabled := true;
 end;

procedure TForm_main.btnFieldClick(Sender: TObject);
begin
 PopupMenu2.Popup(Mouse.CursorPos.X,Mouse.CursorPos.Y);
end;
 procedure TForm_Main.item_click(Sender: TObject);
var i:Integer;
begin
  (Sender as TMenuItem).Checked:=not (Sender as TMenuItem).Checked;
  if (Sender as TMenuItem).Checked then
  begin
    for i:=0 to DBGridEh1.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=True;
        Break;
      end;
  end
  else
  begin
    for i:=0 to DBGridEh1.Columns.Count-1 do
      if (Sender as TMenuItem).Caption=DBGridEh1.Columns[i].Title.Caption then
      begin
        DBGridEh1.Columns[i].Visible:=False;
        Break;
      end;
  end;
end;
procedure TForm_main.N2Click(Sender: TObject);
begin
 if (strtoint(vprev) = 1) or (strtoint(vprev)= 3 ) then
   begin
    messagedlg('对不起!您没有该程序的可写权限',mtinformation,[mbok],0);
    Exit;
   end;
   begin
    dm.Ado538.Edit;
    dm.Ado538HCL_STATUS.Value := 2;
    dm.Ado538HCL_USER_PTR.Value := strtoint(user_ptr);

    dm.tmp.SQL.Clear;
    dm.tmp.SQL.Text := 'select getdate() as t';
    dm.tmp.ExecSQL;
    dm.tmp.Open;
    dm.Ado538HCL_DATE.Value := dm.tmp.fieldbyname('t').AsDateTime;
    dm.tmp.Close;
    dm.Ado538.Post;
    dm.Ado538.UpdateBatch();
   end;
  BitBtn2.Click;
end;

procedure TForm_main.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin
//  if dbgrideh1.DataSource.DataSet.FieldByName('HCL_STATUS').Value = 2 then
//     DBGridEh1.Canvas.Font.Color := clPurple
//  else if dbgrideh1.DataSource.DataSet.FieldByName('HCL_STATUS').Value = 1 then
//     DBGridEh1.Canvas.Font.Color := clGreen;
//  DBGridEh1.DefaultDrawColumnCell(Rect, DataCol, Column, State);
end;

end.
