unit Inv_Group_Select;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls, DB, ADODB, Provider,
  DBClient;

type
  Tfrm_Inv_Group_Select = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    ADS19: TADODataSet;
    DataSource1: TDataSource;
    ADS19inv_group_name: TStringField;
    ADS19inv_group_desc: TStringField;
    ADS19selected: TBooleanField;
    ADS19rkey: TAutoIncField;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ADS19BeforeDelete(DataSet: TDataSet);
    procedure ADS19BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    PreColumn:TColumnEh;
     function UpdateValueToField(pDataSet:TDataSet;value:variant;FieldName:string):boolean;
  public
    { Public declarations }
    procedure Enter(rKey:integer);
  end;

var
  frm_Inv_Group_Select: Tfrm_Inv_Group_Select;

implementation

uses Udm,MyClass,common;

{$R *.dfm}

{ Tfrm_MultiSelectItem }

procedure Tfrm_Inv_Group_Select.Enter(rKey: integer);
begin

 // MyDataClass.UpdateValueToField(ADS417_1,checkbox1.Checked,'selected');
  //ads73clientds.Locate('rKey',rKey,[]);
end;

procedure Tfrm_Inv_Group_Select.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker = smDownEh then
  begin
    Column.Title.SortMarker := smUpEh;
    ADS19.IndexFieldNames :=Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    ADS19.IndexFieldNames :=Column.FieldName+' DESC';
  end;

  if(PreColumn.FieldName<>Column.FieldName) and
     (Column.Field.DataType in [ftString,ftwideString]) then
  begin
    Label1.Caption :=Column.Title.Caption;
    Edit1.SetFocus;
    PreColumn.Title.Color :=clBtnFace;
    Column.Title.Color:=clRed;
    PreColumn :=Column;
  end
  else
    Edit1.SetFocus;
end;

procedure Tfrm_Inv_Group_Select.FormShow(Sender: TObject);
begin

  PreColumn:=DBGridEh1.Columns[1];
//   ShowMessage(ADS816.CommandText);
  ADS19.Close;
  ADS19.Open;

end;

procedure Tfrm_Inv_Group_Select.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(Chr(Key)='V') and (ssalt in shift) then
  ShowMessage(ADS19.CommandText);
end;

procedure Tfrm_Inv_Group_Select.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if ModalResult = mrok then
  begin
    try
      ADS19.DisableControls;
      MyDataClass.Set_Filter('selected=1',ADS19);
 //     ShowMessage(ADS417_1rKey.AsString);
      if ADS19.IsEmpty then
      begin
        ShowMsg('请选择材料组别',1);
        CanClose := False;
        ADS19.Filter:='';
        ADS19.Filtered := false;
        exit;
      end;
    finally
      ADS19.EnableControls;
    end;
  end;
end;

procedure Tfrm_Inv_Group_Select.Edit1Change(Sender: TObject);
begin

  if Trim(Edit1.Text) <> '' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

function Tfrm_Inv_Group_Select.UpdateValueToField(pDataSet: TDataSet;
  value: variant; FieldName: string): boolean;
var
  BookMark:Tbookmark;
begin
  try
    BookMark:=pDataSet.GetBookmark;
    pDataSet.DisableControls;
    try
      pDataSet.First;
      while not pDataSet.Eof do begin
        pDataSet.Edit;
        pDataSet.FieldByName(FieldName).Value := Value;
        pDataSet.Post;
        pDataSet.Next;
      end;
      result := true;
      if BookMark <> nil then
        pDataSet.GotoBookmark(BookMark);
    except
      result := false;
    end;
  finally
    pDataSet.FreeBookmark(Bookmark);
    pDataSet.EnableControls;
  end;
end;

procedure Tfrm_Inv_Group_Select.CheckBox1Click(Sender: TObject);
begin
  UpdateValueToField(ADS19,checkbox1.Checked,'selected');
end;




procedure Tfrm_Inv_Group_Select.ADS19BeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure Tfrm_Inv_Group_Select.ADS19BeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

end.
