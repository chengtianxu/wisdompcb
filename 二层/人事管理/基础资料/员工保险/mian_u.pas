unit mian_u;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, Menus,DB,ADODB,
  Spin,DateUtils,StrUtils;

type
  Tfrm_main = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    dbgrdh1: TDBGridEh;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    BitBtn3: TBitBtn;
    BitBtn4: TBitBtn;
    BitBtn5: TBitBtn;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    pm1: TPopupMenu;
    N1: TMenuItem;
    grp1: TGroupBox;
    PMFlds: TPopupMenu;
    se1: TSpinEdit;
    se2: TSpinEdit;
    se3: TSpinEdit;
    se4: TSpinEdit;
    lbl1: TLabel;
    lbl2: TLabel;
    img1: TImage;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    procedure BitBtn1Click(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure BitBtn4Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure dbgrdh1TitleClick(Column: TColumnEh);
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn5Click(Sender: TObject);
    procedure se1Change(Sender: TObject);
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
  private
    tmp:array[1..10] of TCheckBox;
    tmp_count: Integer;
    PreColumn: TColumnEh;
    field_name:string;
    sSql :string;
    FsCheck,FsSearch,month_a,month_b:string;
    procedure item_click(sender:TObject);
    procedure init;
    //sSql :string;
    //FsCheck,FsSearch:string;
    //procedure item_click(sender:TObject);
    //procedure init;
  public
    { Public declarations }
  end;

var
  frm_main: Tfrm_main;

implementation

uses damo, p_add_u,common, edit_u;

{$R *.dfm}

procedure Tfrm_main.BitBtn1Click(Sender: TObject);
begin
 Application.Terminate;
end;

procedure Tfrm_main.N1Click(Sender: TObject);
begin
  with frm_p_add do
  try
    if Assigned(frm_p_add)=False then
    Application.CreateForm(Tfrm_p_add, frm_p_add);

    DataSource1StateChange(DataSource1);
    DataSource1.DataSet.Open;
   // DataSource1.DataSet.Append;
    ShowModal;
  finally
    DataSource1.DataSet.Close;
    //BitBtn2Click (nil);
  end;
end;

procedure Tfrm_main.FormCreate(Sender: TObject);
var
i,k,j:integer;
begin
  {
  if not App_Init(dm.ADOCon ) then
  begin
    ShowMsg('程序起动失败请联系管理员',1);
    application.Terminate;
    exit;
  end; }
  Caption := application.Title;
  //dm.ADOCon.Open;
 // user_ptr := '3';
 // vprev := '4';
  DateSeparator := '-';
  ShortDateFormat := 'yyyy-mm-dd';
  se1.Value :=YearOf(now);
  se3.Value :=monthof(now);
  se2.Value :=YearOf(now);
  se4.Value :=monthof(now);
  if se3.Value<10 then month_a:= IntToStr(se1.Value)+'0'+inttostr(se3.Value)
  else  month_a:=IntToStr(se1.Value)+inttostr(se3.Value) ;
  if se4.Value<10 then month_b:= IntToStr(se2.Value)+'0'+inttostr(se4.Value)
  else  month_b:=IntToStr(se2.Value)+inttostr(se4.Value) ; 
  init;
DM.ds3.Open;
k:=0;
j:=15;
if not  DM.dt_dictid.Active then dm.dt_dictid.Open;

 if dm.dt_dictid.RecordCount>0 then
 begin
  tmp_count:= dm.dt_dictid.RecordCount;
  for i:=1 to dm.dt_dictid.RecordCount do
  begin
    if k>grp1.Width then
    begin
      k:=0;
      j:=j+25;
    end;
    tmp[i]:=TCheckBox.Create(self);
    tmp[i].Parent:=grp1;
    tmp[i].Caption := dm.dt_dictiditem.AsString;
    tmp[i].Tag := dm.dt_dictidrkey.AsInteger;
    tmp[i].Top:=grp1.Top+j;
    tmp[i].Left:=grp1.Left+5+k;
    tmp[i].Width := 50+Length(tmp[i].Caption)*6;
    k:= k+5+tmp[i].Width;
    tmp[i].Show;
    tmp[i].OnClick := BitBtn2Click  ;
    DM.dt_dictid.Next;
  end;

end;


end;

procedure Tfrm_main.BitBtn4Click(Sender: TObject);
begin
  if not DM.DS3.IsEmpty then
    Export_dbGridEH_to_Excel(dbgrdh1,Application.Title);
end;

procedure Tfrm_main.BitBtn2Click(Sender: TObject);
var sql_str_type : string;
    i,j,k: Integer;
begin

 sql_str_type:= '(0';
 for  i:=1 to tmp_count do
 begin
    if tmp[i].Checked then  sql_str_type := sql_str_type +','+ IntToStr(tmp[i].tag);
 end;
 sql_str_type := ' and insurance_type in '+ sql_str_type+')';
ShowMessage(sql_str_type);
Label3.Caption := IntToStr(dbgrdh1.DataSource.DataSet.RecordCount);
end;

procedure Tfrm_main.dbgrdh1TitleClick(Column: TColumnEh);
begin
 if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    DM.ds3.IndexFieldNames:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    DM.ds3.IndexName:=Column.FieldName+' DESC';
  end;
  //DM.ds3AfterScroll(DM.ds3);
  if dbgrdh1.DataSource.DataSet.FieldByName(Column.FieldName).DataType in [ftDate, ftTime, ftDateTime] then exit;
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
end;

procedure Tfrm_main.Edit1Change(Sender: TObject);
begin
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).FieldKind = fkCalculated then  exit;
  if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in [ftString,ftWideString,ftSmallint,ftInteger]  then
  begin
    if trim(Edit1.text) <> '' then
    begin
      if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftString, ftWideString]  then
        dbgrdh1.DataSource.DataSet.Filter:=' (' +  field_name + ' like ''%' + trim(edit1.text) + '%'')'
      else if dbgrdh1.DataSource.DataSet.FieldByName(field_name).DataType in  [ftSmallint, ftInteger]  then
        dbgrdh1.DataSource.DataSet.Filter:=' (' + field_name+' >= ' + inttostr(strtointdef(edit1.text,0))+')';
    end else
      dbgrdh1.DataSource.DataSet.Filter:='';
  end;
  Label3.Caption := IntToStr(dbgrdh1.DataSource.DataSet.RecordCount);
end;

procedure Tfrm_main.init;
var  i:byte;
  item:TMenuItem;
begin
  Label1.Caption :=dbgrdh1.Columns[0].Title.Caption;
  field_name := dbgrdh1.Columns[0].FieldName;
  PreColumn := dbgrdh1.Columns[0];
  dbgrdh1.Columns[0].Title.Color := clred ;
  for i := 1 to dbgrdh1.Columns.Count do
  begin
    item := TmenuItem.Create(self);
    item.Caption := dbgrdh1.Columns[i - 1].Title.Caption;
    item.Checked :=dbgrdh1.Columns[i - 1].Visible ;
    item.OnClick := item_click ;
    PMFlds.Items.Add(item) ;
  end;
  //sSql:=DM.ADO70.SQL.Text;
  //FsSearch:='  ';
  //CheckBox1Click(nil);
end;


procedure Tfrm_main.BitBtn5Click(Sender: TObject);
begin
PMFlds.Popup(mouse.CursorPos.x,mouse.CursorPos.y);
end;

procedure TFrm_main.item_click(sender: TObject);
var
  i:byte;
begin
  (sender as tmenuItem).Checked := not ((sender as tmenuItem).Checked);
  if (sender as tmenuItem).Checked then
  begin
    for i := 0 to dbgrdh1.FieldCount - 1 do
    if dbgrdh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrdh1.Columns[i].Visible := true;
      break;
    end;
  end else begin
    for i := 0 to dbgrdh1.FieldCount - 1 do
    if dbgrdh1.Columns[i].Title.Caption = (sender as tmenuItem).Caption then
    begin
      dbgrdh1.Columns[i].Visible := false;
      break;
    end;
  end;

end;

procedure Tfrm_main.se1Change(Sender: TObject);
begin
  if se3.Value<10 then month_a:= IntToStr(se1.Value)+'0'+inttostr(se3.Value)
  else  month_a:=IntToStr(se1.Value)+inttostr(se3.Value) ;
  if se4.Value<10 then month_b:= IntToStr(se2.Value)+'0'+inttostr(se4.Value)
  else  month_b:=IntToStr(se2.Value)+inttostr(se4.Value) ;
end;

procedure Tfrm_main.N3Click(Sender: TObject);
begin
  try
  //  if Assigned(frm_Main1)=False then
    begin
      Application.CreateForm(Tfrm_edit,frm_edit);
    end;
    DM.ds3.Edit;
    frm_edit.ET( frm_edit,['edt_chinesename1']);
    frm_edit.ShowModal;
  finally
    frm_edit.Free;
  end;
end;

procedure Tfrm_main.N2Click(Sender: TObject);
begin
  try
  //  if Assigned(frm_Main1)=False then
    begin
      Application.CreateForm(Tfrm_edit, frm_edit);
    end;
    DM.ds3.Append;
    frm_edit.ET( frm_edit,['edt_chinesename1']);
    frm_edit.ShowModal;
  finally
    frm_edit.Free;
  end;
end;

end.
