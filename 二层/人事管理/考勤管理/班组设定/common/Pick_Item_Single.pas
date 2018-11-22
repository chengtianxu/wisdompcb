unit Pick_Item_Single;

interface

uses Windows, Messages,SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, DB, ADODB,ConstVar,StrUtils,variants,
  ComCtrls, DBClient,Dialogs;

type
  TfrmPick_Item_Single = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edtKeyValue: TEdit;
    adsPick1: TADODataSet;
    dsPick: TDataSource;
    StatusBar1: TStatusBar;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure edtKeyValueChange(Sender: TObject);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure dsPickDataChange(Sender: TObject; Field: TField);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    KeyField: string;
    Tmp_Input:string;//Tmp_input输入的查找数值
    PreColumn: TColumn; //上次选择的column
    OldGridWnd : TWndMethod;
    procedure NewGridWnd(var Message: TMessage);
    procedure Add_Grid_Fields(Fields:string);overload;
    procedure Add_Grid_Fields_New(StrFields:string);overload;
    procedure Adjust_Column_Width;
  public
    adsPick:TADODataSet;
    procedure InitForm(InputVar: PDlgInput);
    procedure InitForm_New(InputVar: PDlgInput;dst:TADODataSet=nil); //可传入字段的宽度,格式:'FieldName1/Caption1/width1,FieldName2/Caption2/width2,...'
    function Get_Rslt:variant;//返回挑选的记录数值
  end;

var
  frmPick_Item_Single: TfrmPick_Item_Single;

implementation

{$R *.dfm}

{ TfrmPick_Item_Single }
procedure TfrmPick_Item_Single.NewGridWnd(var Message: TMessage);
var
 IsNeg : Boolean;
begin
 if Message.Msg = WM_MOUSEWHEEL then
  begin
   IsNeg := Short(Message.WParamHi) < 0;
   if IsNeg then
    dbgrid1.DataSource.DataSet.MoveBy(1)
   else
    dbgrid1.DataSource.DataSet.MoveBy(-1)
  end
 else
  begin
   OldGridWnd(Message);
  end;
end;


procedure TfrmPick_Item_Single.Add_Grid_Fields(Fields:string);
var
  i,j:integer;
  Left_str,right_str,FieldName,FieldCaption:string;
  NewColumn:TColumn;
begin
  if Fields='' then exit;
  //从字段信息串中获取每个字段名称以及显示caption
  i:= Pos(',',fields);
  if i > 0 then //找到了字段分割符号
  begin
    left_str:= leftbStr(Fields,i-1);     //获取第一个字段部分
    right_str:=rightbStr(Fields,Length(Fields)-i);//获取除了第一个字段剩余部分
  end
  else
    left_str := Fields; //如果没有找到','

  j:=Pos('/',left_str);
  if j>0 then //如果有'/'分割符号，表示有效
  begin
    FieldName:= leftbstr(left_str,j-1);
    FieldCaption:=rightbStr(left_str,Length(left_str)-j);
    NewColumn:= DbGrid1.Columns.Add;
    NewColumn.FieldName := FieldName;
    NewColumn.Title.Caption := FieldCaption;
  end;
  Add_Grid_Fields(right_str); //递归运算，直到所有字段全部分解完全
  Caption := '选择'+dbgrid1.Columns[0].Title.caption;
end;

function TfrmPick_Item_Single.Get_Rslt: variant;
begin
  result := adsPick.fieldbyName(KeyField).Value;
end;

procedure TfrmPick_Item_Single.InitForm(InputVar: PDlgInput);
begin
  adsPick:=adsPick1;
  dsPick.DataSet:=adsPick;

  adsPick.Connection := InputVar.AdoConn;
  adsPick.CommandText := InputVar.Sqlstr;
  adsPick.Close;
  adsPick.open;
  if InputVar.KeyField = '' then
    KeyField :='rKey'
  else
    KeyField :=InputVar.KeyField;
  if VarAsType(InputVar.InPut_value,varString) <> '' then
    adsPick.Locate(KeyField,InputVar.InPut_value,[]);
  Add_Grid_Fields(InputVar.Fields);
//分配栏位的宽度
  Adjust_Column_Width;
  PreColumn:= DBGrid1.Columns[0];
  PreColumn.title.Color := clred;
  Caption := '选择'+dbgrid1.Columns[0].Title.caption;
end;

procedure TfrmPick_Item_Single.DBGrid1DblClick(Sender: TObject);
begin
if not self.adsPick.IsEmpty then
  ModalResult := mrok;
end;

procedure TfrmPick_Item_Single.Adjust_Column_Width;
var
  i :integer;
  TotalSize:integer;
begin
  TotalSize:=0;
  for i := 0 to dbgrid1.Columns.Count - 1 do
    TotalSize := TotalSize + dbgrid1.Columns[i].Field.DisplayWidth;

  for i := 0 to dbgrid1.Columns.Count - 1 do
    dbgrid1.Columns[i].Width := trunc((dbgrid1.Columns[i].Field.DisplayWidth / TotalSize)*DBGrid1.ClientWidth);
end;

procedure TfrmPick_Item_Single.DBGrid1TitleClick(Column: TColumn);
begin

if adspick.IndexFieldNames<>column.FieldName then
 begin
  adsPick.IndexFieldNames := column.FieldName;
  StatusBar1.Panels[1].Text := Column.Title.Caption;
 end;

if (precolumn.FieldName<>column.FieldName) and
  (dbgrid1.DataSource.DataSet.FieldByName(column.FieldName).DataType in [ftString, ftWideString]) then
 begin
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
  edtkeyvalue.SetFocus;
  label1.Caption:=column.Title.Caption;
 end;


end;

procedure TfrmPick_Item_Single.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key= Chr(vk_Back) then
    Tmp_input:=copy(Tmp_input,1,Length(Tmp_input)-1)
  else
  begin
    if key<>chr(vk_return) then
    Tmp_Input:=Tmp_Input+Key;
    adsPick.Locate(precolumn.FieldName,Tmp_input,[loPartialKey]);
  end;
  StatusBar1.Panels[1].Text := Tmp_Input;
  
end;


procedure TfrmPick_Item_Single.edtKeyValueChange(Sender: TObject);
begin

  if trim(edtKeyValue.text)<>'' then
  begin
    adsPick.Filter:=PreColumn.FieldName+ ' like ''*'+trim(edtKeyValue.TEXT)+'*''';
  end
  else
    adsPick.Filter:='';
end;


procedure TfrmPick_Item_Single.Add_Grid_Fields_New(StrFields: string);
var
  i,j,k,TotalWidth,ColWidth:integer;
  Left_str,right_str,FieldName,FieldCaption,TmpStr:string;
  NewColumn:TColumn;
begin
  TotalWidth:=0;
  while StrFields <> '' do begin
    //从字段信息串中获取每个字段名称以及显示caption
    i:= Pos(',',StrFields);
    if i > 0 then //找到了字段分割符号
    begin
      left_str:= leftbStr(StrFields,i-1);     //获取第一个字段部分
      right_str:=rightbStr(StrFields,Length(StrFields)-i);//获取除了第一个字段剩余部分
    end
    else
    begin
      left_str := StrFields; //如果没有找到','
      right_str:='';
    end;

    j:=Pos('/',left_str);  //第一个'/'
    if j>0 then //如果有'/'分割符号，表示有效
    begin
      ColWidth := 0;
      FieldName:= leftbstr(left_str,j-1);
//      FieldCaption:=rightbStr(left_str,Length(left_str)-j);
      TmpStr:=rightbStr(left_str,Length(left_str)-j);
      k:= Pos('/',Tmpstr);     // 第二个'/'
      if K > 0 then  //存在字段宽度数据
      begin
        FieldCaption:=leftbStr(Tmpstr,k-1);
        ColWidth := StrToInt(rightbStr(Tmpstr,length(tmpstr)-k));
        TotalWidth := TotalWidth + ColWidth;
      end
      else
        FieldCaption:=Tmpstr;
      NewColumn:= DbGrid1.Columns.Add;
      NewColumn.FieldName := FieldName;
      NewColumn.Title.Caption := FieldCaption;
      if ColWidth <> 0 then
        NewColumn.Width := ColWidth;
    end;
    StrFields:= right_str;
  end;
//  if self.Width < TotalWidth +28 then  
   self.width := TotalWidth + 35;
end;

procedure TfrmPick_Item_Single.InitForm_New(InputVar: PDlgInput;dst:TADODataSet=nil);
var
 search_option:tlocateoptions;
begin
  if dst=nil then
  begin
    adsPick:=adsPick1;
    adsPick.Connection := InputVar.AdoConn;
    adsPick.CommandText := InputVar.Sqlstr;
    adsPick.Close;
    adsPick.open;
  end else
    adsPick:=dst;
  dsPick.DataSet:=adsPick;

  if InputVar.KeyField = '' then
    KeyField :='rKey'
  else
    KeyField :=InputVar.KeyField;
  search_option := [lopartialkey];
  if VarAsType(InputVar.InPut_value,varString) <> '' then
    adsPick.Locate(KeyField,InputVar.InPut_value,search_option);
  Add_Grid_Fields_New(InputVar.Fields);
//分配栏位的宽度
  PreColumn:= DBGrid1.Columns[0];
  PreColumn.title.Color := clred;
  label1.Caption:=precolumn.Title.Caption;
  Caption := '选择'+dbgrid1.Columns[0].Title.caption;
end;

procedure TfrmPick_Item_Single.DBGrid1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
 if (chr(key)='V') and (ssalt in shift) then
  messagedlg(ADspick.CommandText,mtinformation,[mbok],0);
end;

procedure TfrmPick_Item_Single.dsPickDataChange(Sender: TObject;
  Field: TField);
begin
if self.adsPick.IsEmpty then
 okbtn.Enabled := false
else
 okbtn.Enabled := true;
end;

procedure TfrmPick_Item_Single.FormCreate(Sender: TObject);
begin
 OldGridWnd := DBGrid1.WindowProc;
  DBGrid1.WindowProc := NewGridWnd;
end;

end.
