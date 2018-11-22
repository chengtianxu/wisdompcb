unit Pick_Item;

interface

uses Windows, SysUtils, Classes, Graphics, Forms, Controls, StdCtrls,
  Buttons, ExtCtrls, Grids, DBGrids, DB, StrUtils,variants,
  ComCtrls, DBClient,ConstDeclare;

type
  TfrmPick_Item = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    OKBtn: TButton;
    CancelBtn: TButton;
    DBGrid1: TDBGrid;
    Label1: TLabel;
    edtKeyValue: TEdit;
    dsPick: TDataSource;
    StatusBar1: TStatusBar;
    adsPick: TClientDataSet;
    procedure DBGrid1DblClick(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure edtKeyValueChange(Sender: TObject);
  private
    { Private declarations }
    ASC : Boolean;//是否升序排列    
    KeyField: string;
    Tmp_Field,Tmp_Input:string;//Tmp_input输入的查找数值, Tmp_Field: 当前查找字段
    PreColumn: TColumn; //上次选择的column
    procedure Add_Grid_Fields(Fields:string);
    procedure Adjust_Column_Width;
    procedure Sort_Data(SortColumn: TColumn);
  public
    { Public declarations }
    procedure InitForm(InputVar: DlgPickItem);
    function Get_Rslt:variant;//返回挑选的记录数值
  end;

var
  frmPick_Item: TfrmPick_Item;

implementation

{$R *.dfm}

{ TfrmPick_Item_Single }

procedure TfrmPick_Item.Add_Grid_Fields(Fields:string);
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

function TfrmPick_Item.Get_Rslt: variant;
begin
  result := adsPick.fieldbyName(KeyField).Value;
end;

procedure TfrmPick_Item.InitForm(InputVar: DlgPickItem);
begin
  adsPick.Close;
  adsPick.Data := InputVar.vData;
  adsPick.open;
  if InputVar.KeyField = '' then
    KeyField :='rKey'
  else
    KeyField :=InputVar.KeyField;
//  if (InputVar.InPut_value <> NULL) and (not adsPick.IsEmpty) then
//    adsPick.Locate(KeyField,InputVar.InPut_value,[]);
  Add_Grid_Fields(InputVar.Fields);
//分配栏位的宽度
  Adjust_Column_Width;
  PreColumn:= DBGrid1.Columns[0];
  PreColumn.title.Color := clred;
  
end;

procedure TfrmPick_Item.DBGrid1DblClick(Sender: TObject);
begin
  ModalResult := mrok;
end;

procedure TfrmPick_Item.Adjust_Column_Width;
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

procedure TfrmPick_Item.DBGrid1TitleClick(Column: TColumn);
begin
  Tmp_Field := Column.FieldName;
  PreColumn.Title.Color := clBtnFace;
  Column.Title.Color := clred;
  PreColumn := column;
  Sort_Data(Column);
  StatusBar1.Panels[1].Text := Column.Title.Caption;
end;

procedure TfrmPick_Item.DBGrid1KeyPress(Sender: TObject;
  var Key: Char);
begin
  if Key= Chr(vk_Back) then
    Tmp_input:=copy(Tmp_input,1,Length(Tmp_input)-1)
  else
  begin
    if key<>chr(vk_return) then
    Tmp_Input:=Tmp_Input+Key;
    adsPick.Locate(Tmp_Field,Tmp_input,[loPartialKey]);
  end;
  StatusBar1.Panels[1].Text := Tmp_Input;
end;


procedure TfrmPick_Item.edtKeyValueChange(Sender: TObject);
begin
//  adsPick.Locate(Tmp_Field,trim(edtKeyValue.Text),[loPartialKey]);
  if trim(edtKeyValue.text)<>'' then
  begin
    adsPick.Filter:=' Upper('+PreColumn.FieldName+ ') like ''%'+uppercase(trim(edtKeyValue.TEXT))+'%''';
    adsPick.Filtered := true;
  end
  else
    adsPick.Filtered:= false;
end;

procedure TfrmPick_Item.Sort_Data(SortColumn: TColumn);
var OldIndex:string;
begin
  if (SortColumn.Grid.DataSource=nil) or (SortColumn.Grid.DataSource.DataSet=nil) or (not SortColumn.Grid.DataSource.DataSet.Active) then
    Exit;
  OldIndex:=TClientDataSet(SortColumn.Field.DataSet).IndexName;

  if OldIndex<>'' then
  begin
    TClientDataSet(SortColumn.Field.DataSet).IndexName:='';
    TClientDataSet(SortColumn.Field.DataSet).DeleteIndex(OldIndex);
  end;
  case ASC of
    True :
      TClientDataSet(SortColumn.Field.DataSet).AddIndex('px',SortColumn.Field.FieldName,[ixDescending]);//已经是升序就按降序排列
    else//否则按升序排列
      TClientDataSet(SortColumn.Field.DataSet).AddIndex('px',SortColumn.Field.FieldName,[ixPrimary]);
  end;{end case}

  TClientDataSet(SortColumn.Field.DataSet).IndexName:='px';
  ASC:=not ASC;
end;

end.
