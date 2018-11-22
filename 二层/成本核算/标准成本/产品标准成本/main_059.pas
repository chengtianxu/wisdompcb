unit main_059;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, DB, ADODB, StdCtrls, Grids, DBGrids, ComCtrls, Buttons, ExtCtrls,
  DBGridEh, Menus;

type
  Tfrmmain_059 = class(TForm)
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    edtKey: TEdit;
    StatusBar1: TStatusBar;
    DBGridEh1: TDBGridEh;
    dtpStartDate: TDateTimePicker;
    dtpEndDate: TDateTimePicker;
    Label1: TLabel;
    labelKey: TLabel;
    PopupMenu1: TPopupMenu;
    PopupMenu2: TPopupMenu;
    M1: TMenuItem;
    M2: TMenuItem;
    MenuItem3: TMenuItem;
    M3: TMenuItem;
    M4: TMenuItem;
    Panel2: TPanel;
    Label2: TLabel;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox4: TCheckBox;
    btn1: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn3Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure DBGridEh1CellClick(Column: TColumnEh);
    procedure dtpStartDateChange(Sender: TObject);
    procedure edtKeyChange(Sender: TObject);
    procedure edtKeyKeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure PopupMenu2Popup(Sender: TObject);
    procedure M3Click(Sender: TObject);
    procedure M2Click(Sender: TObject);
    procedure M1Click(Sender: TObject);
    procedure DBGridEh1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumnEh; State: TGridDrawState);
    procedure FormCreate(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure M4Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
    sqlstr,FsBOM_status:string;
    procedure DoSearch(subSql:string);
    procedure item_click(sender:TObject);
    procedure Enter_Detail(EnterMode:byte);
  public
    { Public declarations }
  end;

var
  frmmain_059: Tfrmmain_059;

implementation
uses MyClass,ConstVar,common,QuerySet,dm,product_MiDetail, qry492;
{$R *.dfm}

procedure Tfrmmain_059.FormCreate(Sender: TObject);
begin
  if not App_Init_2(dmcon.ADOConnection1) then
  begin
    ShowMsg('程序启动失败，请联系系统管理员！','提示',1);
    application.Terminate;
  end;
  self.Caption :=Application.Title;

//  vprev:='4';
//   user_ptr:='5';
//   dmcon.ADOConnection1.Open;
end;

procedure Tfrmmain_059.FormShow(Sender: TObject);
begin
  MyDataClass := TMyDataClass.Create(dmcon.ADOConnection1);
  dtpStartDate.Date := date-3;
  dtpEndDate.Date := date;
  if (DBGridEh1.Columns.Count > 0) and (dmcon.adsProdLists.Active) then
    DBGridEh1CellClick(DBGridEh1.Columns[0]);

  CheckBox1Click(nil);
end;

procedure Tfrmmain_059.FormDestroy(Sender: TObject);
begin
  MyDataClass.Free;
end;

procedure Tfrmmain_059.BitBtn1Click(Sender: TObject);
begin
  close;
end;

procedure Tfrmmain_059.BitBtn3Click(Sender: TObject);
begin
  if not dmcon.adsProdLists.Active then exit;
  dmcon.adsProdLists.close;
  dmcon.adsProdLists.open;
end;

procedure Tfrmmain_059.BitBtn2Click(Sender: TObject);
begin
  if dmcon.adsProdLists.IsEmpty then exit;
  Export_dbGridEH_to_Excel(DBGridEh1,'产品BOM设计列表');
end;

procedure Tfrmmain_059.BitBtn4Click(Sender: TObject);
var
  i,j:integer;
begin
  with TfrmQuerySet.Create(Application)do
  try
    if ShowModal = mrOk then
    begin
      sqlstr:= '';
      for i:=1 to sgrid1.RowCount-2 do
      begin
        if sgrid1.Cells[2,i]<> '' then
          Sqlstr:=sqlstr+sgrid1.Cells[2,i];
      end;
      sqlstr:=sqlstr+' and '+fieldName+'>='+QuotedStr(Formatdatetime('yyyy-mm-dd',dtpk1.Date))+' and '+fieldName+'<'+QuotedStr(Formatdatetime('yyyy-mm-dd',dtpk2.Date+1));
      if RadioGroup1.ItemIndex = 0 then
        sqlstr:=sqlstr+' and D25.TType=0 '
      else if RadioGroup1.ItemIndex = 1 then
        sqlstr:=sqlstr+' and D25.TType=1 ';
    end;

    FsBOM_status:='';
    for j:=0 to Panel2.ControlCount-1 do
      if Panel2.Controls[j] is TCheckBox and  TCheckBox(Panel2.Controls[j]).Checked then
    FsBOM_status:=FsBOM_status+inttostr(TCheckBox(Panel2.Controls[j]).Tag)+',' ;
    if FsBOM_status<>'' then
      FsBOM_status:=' and d25.BOM_status in ('+copy(FsBOM_status,1,length(FsBOM_status)-1)+') '
    else
      FsBOM_status:=' and d25.BOM_status=-1 ';
  finally
    free;
  end;
  DoSearch(sqlstr+FsBOM_status);
end;

procedure Tfrmmain_059.DBGridEh1CellClick(Column: TColumnEh);
begin
//  if Column.Field.FieldKind = fkCalculated then abort;
  edtKey.Enabled:= not dmcon.adsProdLists.IsEmpty;
  dtpStartDate.Enabled := edtKey.Enabled;
  dtpEndDate.Enabled := edtKey.Enabled;

  if dmcon.adsProdLists.IsEmpty then abort;
//  SelectedField := Column.FieldName;
  labelKey.Caption := Column.Title.Caption;
  edtKey.Visible:= not(Column.Field.DataType  in [ftDate, ftDateTime]);
  Label1.Visible := not edtKey.Visible;
  dtpStartDate.Visible := Label1.Visible;
  dtpEndDate.Visible := Label1.Visible;
end;

procedure Tfrmmain_059.dtpStartDateChange(Sender: TObject);
var  tmpstr1,Tmpstr2,sFilter:string;
begin
  if not dmcon.adsProdLists.Active then abort;
  TmpStr1:= QuotedStr(DateToStr(dtpStartDate.Date));
  TmpStr2:= QuotedStr(DateToStr(dtpEndDate.Date+1));
  if DBGridEh1.SelectedField.DataType in [ftDate, ftDateTime] then
  begin
    sFilter := DBGridEh1.SelectedField.FieldName+'>='+TmpStr1+ ' AND ' +DBGridEh1.SelectedField.FieldName+'<'+TmpStr2;
    dmcon.adsProdLists.Filter := sFilter;
    dmcon.adsProdLists.Filtered:= true;
  end;
end;

procedure Tfrmmain_059.edtKeyChange(Sender: TObject);
var tmpstr,sFilter:string;
begin
  if not dmcon.adsProdLists.Active then abort;
  tmpstr:= trim(edtKey.Text);
  if TmpStr='' then
    dmcon.adsProdLists.Filtered:= false
  else
  begin
    if (DBGridEh1.SelectedField.DataType in [ftString,ftWideString,ftMemo]) then
    begin
      sFilter := '*'+uppercase(TmpStr)+'*';
      dmcon.adsProdLists.Filter := DBGridEh1.SelectedField.FieldName+' Like '+ QuotedStr(sFilter);
      dmcon.adsProdLists.Filtered:= true;
    end
    else if DBGridEh1.SelectedField.DataType in [ftSmallint, ftInteger, ftWord, ftFloat, ftCurrency, ftBCD,ftLargeint] then
    begin
      if TmpStr='-' then exit;
      sFilter := DBGridEh1.SelectedField.FieldName+'>='+TmpStr;//DBGrid3.SelectedField.FieldName+'>='+TmpStr+' AND '+ DBGrid3.SelectedField.FieldName+'<'+IntToStr(Get_Filter_Of_Fixed_Int(StrToFloat(TmpStr)));
      dmcon.adsProdLists.Filter := sFilter;
      dmcon.adsProdLists.Filtered:= true;
    end
    else if DBGridEh1.SelectedField.DataType in [ftDate, ftDateTime] then
    begin
      if not IsDatetime(TmpStr) then exit;
      sFilter := '>='+QuotedStr(TmpStr);
      dmcon.adsProdLists.Filter := DBGridEh1.SelectedField.FieldName + sFilter;
      dmcon.adsProdLists.Filtered:= true;
    end;
  end;
end;

procedure Tfrmmain_059.edtKeyKeyPress(Sender: TObject; var Key: Char);
begin
  if DBGridEh1.SelectedField.DataType in [ftSmallint, ftInteger, ftWord, ftLargeint] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if Key='.' then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end
  else if  DBGridEh1.SelectedField.DataType in [ftFloat, ftCurrency, ftBCD] then
  begin
    if (length((Sender as TEdit).Text)=20) and (key<>chr(8)) then Abort;
    if (pos('.',(Sender as TEdit).Text)>0) and (key='.') then abort;
    if (pos(key,'-0123456789.')=0) and (key<>chr(8)) then
      Abort;
    if (pos('-',(Sender as TEdit).Text)>0) and (key='-') then abort;
    if Length((Sender as TEdit).text)>0 then
      if (key='-') then abort;
  end ;
end;

procedure Tfrmmain_059.DoSearch(subSql: string);
var
  sqlstr:widestring;
  i:integer;
begin
  if subsql='' then exit;
  sqlstr:=uppercase(dmcon.adsProdLists.CommandText);
  i:=Pos('WHERE',sqlstr);
  if i = 0 then
  begin
    ShowMsg('SQL语句出错,请联系系统管理员',1);
    abort;
  end;
  Sqlstr:=copy(sqlstr,1,i-1);
  dmcon.adsProdLists.Close;
  dmcon.adsProdLists.CommandText := sqlstr + ' WHERE PARENT_PTR IS NULL '+subsql;
  dmcon.adsProdLists.open;
  StatusBar1.Panels[1].Text := IntToStr(dmcon.adsProdLists.RecordCount);
//  showmessage(dmcon.adsProdLists.CommandText);
end;

procedure Tfrmmain_059.DBGridEh1TitleClick(Column: TColumnEh);
var OldIndex:string;
begin
  if (Column.Grid.DataSource=nil) or (Column.Grid.DataSource.DataSet=nil) or (not Column.Grid.DataSource.DataSet.Active) then
    Exit;

  if Column.Title.SortMarker = smDownEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' ASC';
    Column.Title.SortMarker := smUpEh;
  end
  else if Column.Title.SortMarker = smUpEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :='';
    Column.Title.SortMarker := smNoneEh;
  end
  else if Column.Title.SortMarker = smNoneEh then
  begin
    TCustomAdoDataSet(Column.Field.DataSet).Sort :=Column.Field.FieldName+' DESC';
    Column.Title.SortMarker := smDownEh;
  end;{end case}
end;

procedure Tfrmmain_059.PopupMenu1Popup(Sender: TObject);
var
  i:integer;
  MI:TMenuItem;
begin
  while PopupMenu1.Items.Count>0 do
    PopupMenu1.Items[0].free;
  for i:= 0 to DBGridEh1.Columns.Count- 1 do
  begin
    MI:=TmenuItem.Create(self);
    MI.Caption:=DBGridEh1.Columns[i].Title.Caption;
    if DBGridEh1.Columns[i].Visible then
      MI.Checked:=true;
    MI.OnClick:=item_click;
    self.PopupMenu1.Items.Add(MI);
  end;
end;

procedure Tfrmmain_059.item_click(sender: TObject);
var
 i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  for i:=0 to DBGridEh1.Columns.Count-1 do
    if DBGridEh1.Columns[i].Title.Caption=(sender as tmenuItem).Caption then
    begin
      DBGridEh1.Columns[i].Visible:=(sender as tmenuItem).Checked;
      break;
    end;
end;


procedure Tfrmmain_059.BitBtn5Click(Sender: TObject);
begin
  popupmenu1.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure Tfrmmain_059.PopupMenu2Popup(Sender: TObject);
var
  i:integer;
begin
{0：CAM组待后补
2：CAM组后补提交
1：计划BOM提交
4：财务BOM已审
}
  if dmcon.adsProdLists.IsEmpty then abort;
  i:=dmcon.adsProdLists.FieldByName('BOM_status').Asinteger;

  M1.Enabled:= (i=1) and ((vprev='2') or (vprev='4')) ;
  M4.Enabled:=M1.Enabled;
  M3.Enabled:= (i=4) and ((vprev='2') or (vprev='4')) ;

end;

procedure Tfrmmain_059.M3Click(Sender: TObject);
var
  rKey:string;
begin
  if Msg_Dlg_Ask('确认取消该产品型号的成本审核吗?','提示',1) then
  begin
    rKey:=dmcon.adsProdLists.FieldByname('rKey').AsString;
    dmcon.tmp.Close;
    dmcon.tmp.SQL.Text:=' update data0025 set BOM_status=1,cost_appr_by=null,cost_appr_date=null where BOM_status=4 and rKey='+rKey;
    if dmcon.tmp.ExecSQL<>1  then
      ShowMsg('数据状态发生变化,更新失败!',1)
    else
    begin   //更新内层状态
      dmcon.tmp.Close;
      dmcon.tmp.SQL.Text:='select d25_0.rkey,isnull(d25_1.rkey,0) rkey1 from data0025 d25_0 left join data0025 d25_1 '+
                       'on d25_1.parent_ptr=d25_0.rkey where d25_0.parent_ptr='+rkey;
      dmcon.tmp.Open;
      rkey:='';
      while not dmcon.tmp.Eof do
      begin
        rkey:=rkey+dmcon.tmp.Fields[0].AsString+','+dmcon.tmp.Fields[1].AsString+',';
        dmcon.tmp.Next;
      end;
      dmcon.tmp.Close;
      if rkey<>''  then
      begin
        rkey:='('+rkey+'0)';
        dmcon.tmp.SQL.Text:='update data0025 set BOM_status=1,cost_appr_by=null,cost_appr_date=null where rkey in '+rkey;
        dmcon.tmp.ExecSQL;
      end;
    end;
    BitBtn3Click(sender);
    dmcon.adsProdLists.Locate('rKey',rKey,[loCaseInsensitive]);
  end;
end;

procedure Tfrmmain_059.M2Click(Sender: TObject);
var
  rKey:String;
begin
  rKey:=dmcon.adsProdLists.FieldByname('rKey').AsString;
  Enter_Detail(em_browse);
  BitBtn3Click(sender);
  dmcon.adsProdLists.Locate('rKey',rKey,[loCaseInsensitive]);
end;

procedure Tfrmmain_059.Enter_Detail(EnterMode: byte);
begin
  //打开成本的数据表
  try
    application.CreateForm(tForm2,Form2);
    dmcon.AQY0025.Close;
    dmcon.AQY0025.Parameters[0].Value:= dmcon.adsProdLists.FieldByName('rKey').Asinteger;
    dmcon.AQY0025.Open;
    form2.status.Caption:=inttostr(EnterMode) ; //'1'; //代表检查
    form2.EnterMode := EnterMode;
//  dmcon.Open_Cost_Data(dmcon.adsProdLists.FieldByName('rKey').Asinteger);
    if form2.ShowModal=mrok then
    begin
    end;
  finally
    form2.free;
  end
end;

procedure Tfrmmain_059.M1Click(Sender: TObject);
var
  rKey:String;
begin
  rKey:=dmcon.adsProdLists.FieldByname('rKey').AsString;
  Enter_Detail(em_edit);
  BitBtn3Click(sender);
  dmcon.adsProdLists.Locate('rKey',rKey,[loCaseInsensitive]);
end;

procedure Tfrmmain_059.DBGridEh1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumnEh;
  State: TGridDrawState);
begin

  if (dmcon.adsProdLists.FieldByName('BOM_status').Asinteger=4) then
    DBGridEh1.Canvas.Font.Color:=clred
  else if (dmcon.adsProdLists.FieldByName('BOM_status').Asinteger=1) then
   DBGridEh1.Canvas.Font.Color:=clGreen;     //cl3DLight

  DBGridEh1.DefaultDrawColumnCell(Rect,DataCol,Column,State);
end;


procedure Tfrmmain_059.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key)='V') and (ssalt in shift) then showmessage(dmcon.adsProdLists.CommandText);
end;

procedure Tfrmmain_059.M4Click(Sender: TObject);
var
  rKey:string;
  Lsystime: TDateTime;
begin
  if Msg_Dlg_Ask('确认退回该产品型号吗?','提示',1) then
  begin
    rKey:=dmcon.adsProdLists.FieldByname('rKey').AsString;
    dmcon.tmp.Close;
    dmcon.tmp.SQL.Text:=' update data0025 set BOM_status=2,cost_appr_by=null,cost_appr_date=null where BOM_status=1 and rKey='+rKey;
    if dmcon.tmp.ExecSQL<>1  then
      ShowMsg('数据状态发生变化,更新失败!',1)
    else
    begin   //更新内层状态
      dmcon.tmp.Close;
      dmcon.tmp.SQL.Text:='select d25_0.rkey,isnull(d25_1.rkey,0) rkey1 from data0025 d25_0 left join data0025 d25_1 '+
                       'on d25_1.parent_ptr=d25_0.rkey where d25_0.parent_ptr='+rkey;
      dmcon.tmp.Open;
      rkey:='';
      while not dmcon.tmp.Eof do
      begin
        rkey:=rkey+dmcon.tmp.Fields[0].AsString+','+dmcon.tmp.Fields[1].AsString+',';
        dmcon.tmp.Next;
      end;
      dmcon.tmp.Close;
      if rkey<>''  then
      begin
        rkey:='('+rkey+'0)';
        dmcon.tmp.SQL.Text:='update data0025 set BOM_status=2,cost_appr_by=null,cost_appr_date=null where rkey in '+rkey;
        dmcon.tmp.ExecSQL;
      end;

      //
      dmcon.tmp.Close;
      dmcon.tmp.SQL.Clear;
      dmcon.tmp.SQL.Add('select getdate() as systm');
      dmcon.tmp.Open;
      Lsystime := dmcon.tmp.fieldbyname('systm').AsDateTime;

      dmcon.tmp.Close;
      dmcon.tmp.SQL.Clear;
      dmcon.tmp.SQL.Add('select * from data0318 where rkey = -1');
      dmcon.tmp.Open;
      dmcon.tmp.Append;
      dmcon.tmp.FieldByName('CUSTOMER_PART_PTR').AsInteger := dmcon.adsProdLists.FieldByname('rKey').AsInteger;
      dmcon.tmp.FieldByName('TRANS_TYPE').AsInteger := 25;
      dmcon.tmp.FieldByName('TRANS_DESCRIPTION').AsString := '退回BOM';
      dmcon.tmp.FieldByName('FROM_STRING').AsString := '产品标准成本' ;
      dmcon.tmp.FieldByName('TO_STRING').AsString := 'BOM退回操作';
      dmcon.tmp.FieldByName('USER_PTR').AsString := rkey73;//self.Myuser_ptrCaption ;
      dmcon.tmp.FieldByName('TRANS_DATE').AsDateTime := Lsystime ;
      dmcon.tmp.FieldByName('PROGRAM_SOURCE').AsInteger := 25;      
      dmcon.tmp.Post;

      dmcon.tmp.Close; 
    end;
    BitBtn3Click(sender);
    dmcon.adsProdLists.Locate('rKey',rKey,[loCaseInsensitive]);
  end;

end;

procedure Tfrmmain_059.CheckBox1Click(Sender: TObject);
var i:integer;
begin
 FsBOM_status:='';
  for i:=0 to Panel2.ControlCount-1 do
    if Panel2.Controls[i] is TCheckBox and  TCheckBox(Panel2.Controls[i]).Checked then
  FsBOM_status:=FsBOM_status+inttostr(TCheckBox(Panel2.Controls[i]).Tag)+',' ;
  if FsBOM_status<>'' then
    FsBOM_status:=' and d25.BOM_status in ('+copy(FsBOM_status,1,length(FsBOM_status)-1)+') '
  else
    FsBOM_status:=' and d25.BOM_status=-1 ';
  if sqlstr = '' then
    sqlstr := ' and (CUSTPART_ENT_DATE ' + ' >= '+QuotedStr(Formatdatetime('yyyy-mm-dd',dtpStartDate.Date))+' and CUSTPART_ENT_DATE < '+QuotedStr(Formatdatetime('yyyy-mm-dd',dtpEndDate.Date+1)) + ')';
  DoSearch(sqlstr+FsBOM_status);
end;

procedure Tfrmmain_059.btn1Click(Sender: TObject);
var
  LFrm: TfrmQry492;
begin
  lFrm := TfrmQry492.Create(Self);
  try
    LFrm.ShowModal;
  finally
    LFrm.Free;
  end;
end;

end.
