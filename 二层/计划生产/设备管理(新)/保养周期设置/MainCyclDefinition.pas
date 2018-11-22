unit MainCyclDefinition;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Grids, DBGridEh, ExtCtrls, DB, ADODB, Provider,
  DBClient;

type
  Tfrm_MainCyclDefinition = class(TForm)
    Panel1: TPanel;
    DBGridEh1: TDBGridEh;
    Panel2: TPanel;
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    ADS816: TADODataSet;
    DataSource1: TDataSource;
    ADS816selected: TBooleanField;
    ADS816MainCycl: TStringField;
    ADS816cycl_duration: TIntegerField;
    ADS816rkey: TWordField;
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure FormShow(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ADS816BeforeDelete(DataSet: TDataSet);
    procedure ADS816BeforeInsert(DataSet: TDataSet);
  private
    { Private declarations }
    PreColumn:TColumnEh;
     function UpdateValueToField(pDataSet:TDataSet;value:variant;FieldName:string):boolean;
  public
    { Public declarations }
    procedure Enter(rKey:integer);
  end;

var
  frm_MainCyclDefinition: Tfrm_MainCyclDefinition;

implementation

uses damo,MyClass,common;

{$R *.dfm}

{ Tfrm_MultiSelectItem }

procedure Tfrm_MainCyclDefinition.Enter(rKey: integer);
begin

 // MyDataClass.UpdateValueToField(ADS417_1,checkbox1.Checked,'selected');
  //ads73clientds.Locate('rKey',rKey,[]);
end;

procedure Tfrm_MainCyclDefinition.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if Column.Title.SortMarker = smDownEh then
  begin
    Column.Title.SortMarker := smUpEh;
    ADS816.IndexFieldNames :=Column.FieldName;
  end
  else
  begin
    Column.Title.SortMarker := smDownEh;
    ADS816.IndexFieldNames :=Column.FieldName+' DESC';
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

procedure Tfrm_MainCyclDefinition.FormShow(Sender: TObject);
begin

  PreColumn:=DBGridEh1.Columns[1];
//   ShowMessage(ADS816.CommandText);
  ADS816.Close;
  ADS816.Open;

end;

procedure Tfrm_MainCyclDefinition.DBGridEh1KeyDown(Sender: TObject;
  var Key: Word; Shift: TShiftState);
begin
  if(Chr(Key)='V') and (ssalt in shift) then
  ShowMessage(ADS816.CommandText);
end;

procedure Tfrm_MainCyclDefinition.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose := True;
  if ModalResult = mrok then
  begin
    try
      ADS816.DisableControls;
      MyDataClass.Set_Filter('selected=1',ADS816);
 //     ShowMessage(ADS417_1rKey.AsString);
      if ADS816.IsEmpty then
      begin
        ShowMsg('«Î—°‘Ò…Ë±∏',1);
        CanClose := False;
        ADS816.Filter:='';
        ADS816.Filtered := false;
        exit;
      end;
    finally
      ADS816.EnableControls;
    end;
  end;
end;

procedure Tfrm_MainCyclDefinition.Edit1Change(Sender: TObject);
begin

  if Trim(Edit1.Text) <> '' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edit1.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

function Tfrm_MainCyclDefinition.UpdateValueToField(pDataSet: TDataSet;
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

procedure Tfrm_MainCyclDefinition.CheckBox1Click(Sender: TObject);
begin
  UpdateValueToField(ADS816,checkbox1.Checked,'selected');
end;




procedure Tfrm_MainCyclDefinition.ADS816BeforeDelete(DataSet: TDataSet);
begin
  Abort;
end;

procedure Tfrm_MainCyclDefinition.ADS816BeforeInsert(DataSet: TDataSet);
begin
  Abort;
end;

end.
