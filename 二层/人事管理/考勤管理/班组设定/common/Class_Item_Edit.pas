{******************************************************************************}
{                                                                              }
{Code Maker: Jacky Zhong                                                       }
{Date: Jun. 17. 2007                                                           }
{Comments: 该单元是一个基于单表操作的父亲口类。封装了基本操作，用于继承        }
{功能：1.单表操作，可以定义adodataset连接的表，以及dbgrid显示的字段            }
{      2.查询，根据鼠标点中的字段，可以输入字符查询数据。也可以在查找框输入查询}
{                                                                              }
{******************************************************************************}

unit Class_Item_Edit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGrids, StdCtrls, Menus, ComCtrls,db,
  ADODB;

type

//字段排序结构变量，用于记录字段排序方式
  PSort = record
   KeyField: array  of string;
   SortType : array  of string; //1。升序，2。降序
  end;

  TfrmClass_Item_Edit = class(TForm)
    Panel1: TPanel;
    DBGrid1: TDBGrid;
    btnNew: TButton;
    btnEdit: TButton;
    btnDelete: TButton;
    Button4: TButton;
    PopupMenu1: TPopupMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    N4: TMenuItem;
    N5: TMenuItem;
    StatusBar1: TStatusBar;
    btnRefresh: TButton;
    Panel2: TPanel;
    label_Key_Field: TLabel;
    edtKeyValue: TEdit;
    ADOConnection1: TADOConnection;
    adsMaster: TADODataSet;
    dsMaster: TDataSource;
    procedure btnDeleteClick(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyPress(Sender: TObject; var Key: Char);
    procedure DBGrid1CellClick(Column: TColumn);
    procedure btnRefreshClick(Sender: TObject);
    procedure FormActivate(Sender: TObject);
    procedure edtKeyValueChange(Sender: TObject);
  private
    { Private declarations }
    Tmp_Input:string;//输入的查找数值
    function ReturnSortType(KeyField:string):string;//在记录FSort中查找排序方式，没找到就返回''，并把排序方式更新为相反的数值，如：原来是升序，取值后就改为降序
    //判断数据表0277记录是否可以被删除或者编辑,true，可编辑，false不可(注意：如果重写方法就用override覆盖，不要inherited)
//    function Check_Data0277_Edit_State(keyValue:string):boolean;virtual;
    procedure DoSort;//排序
  public
    { Public declarations }
    KeyField: string;//主要字段，用于验证操作数据表记录是否重复等
    FSort: PSort; //存储排序字段记录
    procedure DoDelete;virtual;//删除
  end;

var
  frmClass_Item_Edit: TfrmClass_Item_Edit;

implementation
uses constVar,common;
{$R *.dfm}

procedure TfrmClass_Item_Edit.btnDeleteClick(Sender: TObject);
begin
  DoDelete;
end;

procedure TfrmClass_Item_Edit.Button4Click(Sender: TObject);
begin
  close;
end;

procedure TfrmClass_Item_Edit.DBGrid1TitleClick(Column: TColumn);
begin
//处理排序
  DoSort;
end;

procedure TfrmClass_Item_Edit.DBGrid1KeyPress(Sender: TObject; var Key: Char);
begin
  if Key= Chr(vk_Back) then
    Tmp_input:=copy(Tmp_input,1,Length(Tmp_input)-1)
  else
  begin
    if key<>chr(vk_return) then
    Tmp_Input:=Tmp_Input+Key;
    adsMaster.Locate(Dbgrid1.SelectedField.FieldName,Tmp_input,[loPartialKey]);
  end;
  StatusBar1.Panels[1].Text := Tmp_Input;
end;

procedure TfrmClass_Item_Edit.DBGrid1CellClick(Column: TColumn);
begin
  StatusBar1.Panels[1].Text := Tmp_Input;
  label_Key_Field.Caption := '查找：'+GetColumnCaption(dbgrid1.SelectedField.FieldName,dbgrid1);
end;

procedure TfrmClass_Item_Edit.btnRefreshClick(Sender: TObject);
begin
  adsMaster.Close;
  adsMaster.open;
  FormActivate(Sender);
end;

function TfrmClass_Item_Edit.ReturnSortType(KeyField: string): string;
var
  i:integer;
begin
  result := '';
  for i := Low(FSort.KeyField) to high(FSort.KeyField) do
  begin
    if Fsort.KeyField[i] = trim(KeyField) then
    begin
      result := Fsort.SortType[i];
//取值后，改变排序方式，便于下次取得相反的排序方式
      if Fsort.SortType[i]='ASC' then
        Fsort.SortType[i]:='DESC'
      else
        Fsort.SortType[i]:='ASC';
    end;
  end;
end;

procedure TfrmClass_Item_Edit.DoSort;
var
  SortType:string;
begin
  SortType:=ReturnSortType(Dbgrid1.SelectedField.FieldName);
  if SortType <> '' then
    adsMaster.Sort := Dbgrid1.SelectedField.FieldName +' '+SortType;
end;

procedure TfrmClass_Item_Edit.FormActivate(Sender: TObject);
begin
  StatusBar1.Panels[2].Text := '共：'+IntToStr(adsMaster.RecordCount)+' 笔记录';
end;



{
function TfrmClass_Item_Edit.Check_Data0277_Edit_State(
  keyValue: string): boolean;
begin
  result := not((keyvalue= 'GENUNIT') or
            (keyvalue= 'GENPARAM') or
            (keyvalue= 'BOM') or
            (keyvalue= 'COST') or
            (keyvalue= 'SO'));
end;
 }
procedure TfrmClass_Item_Edit.DoDelete;
begin
  if Msg_Dlg_Ask('确定删除记录吗？','提示',1) then
  begin
    if not DeleteRecord(adsMaster,KeyField,adsMaster.fieldByName(KeyField).Value) then
      ShowMsg('删除失败，请检查','提示',1);
  end;
  FormActivate(self);
end;

procedure TfrmClass_Item_Edit.edtKeyValueChange(Sender: TObject);
begin
  adsMaster.Locate(dbgrid1.SelectedField.FieldName,trim(edtKeyValue.Text),[loPartialKey]);
end;

end.
