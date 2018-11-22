unit AcctSearch;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, DB, DBTables, StdCtrls, Grids, DBGrids, ADODB, ExtCtrls;

type
  TFrmAcctSearch = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    DataSource1: TDataSource;
    BitBtn1: TBitBtn;
    Splitter1: TSplitter;
    Button2: TButton;
    Button1: TButton;
    DBGrid1: TDBGrid;
    ADOData0103: TADODataSet;
    RadioGroup1: TRadioGroup;
    procedure Edit1Change(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure DBGrid1TitleClick(Column: TColumn);
    procedure DBGrid1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGrid1DblClick(Sender: TObject);
  private
    field_name:string;
    PreColumn: TColumn;
  public
    class function getGL_AccNo(var sGLno:string;var sD_C:string;var rkey:integer):boolean;
  end;

  
implementation

uses DM_u;

{$R *.dfm}

procedure TFrmAcctSearch.Edit1Change(Sender: TObject);
begin
 if TRIM(EDIT1.TEXT)<>'' then
  if self.RadioGroup1.ItemIndex=1 then
    adodata0103.Filter := field_name+' like ''%'+trim(EDIT1.TEXT)+'%'''
  else
    adodata0103.Filter := field_name+' like '+''''+trim(EDIT1.TEXT)+'%'''
 else
  adodata0103.FILTER := '';

  button1.Enabled:=adodata0103.RecordCount>0;
end;

procedure TFrmAcctSearch.BitBtn1Click(Sender: TObject);
begin
 edit1.Text:='';
 edit1.SetFocus;
end;

procedure TFrmAcctSearch.DBGrid1TitleClick(Column: TColumn);
begin
{if (column.ReadOnly) and (column.FieldName<>self.field_name) then
 begin
  label1.Caption:=column.Title.Caption;
  field_name:=column.FieldName;
  ADOData0103.Sort:=field_name;
  edit1.SetFocus;
 end;  }
 if (column.ReadOnly) and (column.FieldName<>PreColumn.FieldName) then
 begin
  label1.Caption:=column.Title.Caption;
  PreColumn.Title.Color := clBtnFace;
  PreColumn:=column;
  Column.Title.Color := clred;
  ADOData0103.Sort:=column.FieldName;
  edit1.SetFocus;
 end;
end;

procedure TFrmAcctSearch.DBGrid1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 if (key=13) and (adodata0103.RecordCount>0) then ModalResult:=mrok;
end;

procedure TFrmAcctSearch.DBGrid1DblClick(Sender: TObject);
begin
  if adodata0103.RecordCount>0 then ModalResult:=mrok;

end;

class function TFrmAcctSearch.getGL_AccNo(
  var sGLno: string;var sD_C:string;var rkey:integer): boolean;
begin
  result:=false;
  with TFrmAcctSearch.Create(nil) do
  try
    adodata0103.Open ;
    if adodata0103.IsEmpty then begin showmessage('多栏科目档案未定义');exit; end;
    field_name:='gl_acc_number';
    PreColumn := DBGrid1.Columns[0];
    if showmodal=mrok then
    begin
       sGLno:=adodata0103.fieldbyname('gl_acc_number').AsString ;
       sD_C:=adodata0103.fieldbyname('D_C').AsString ;
       rkey:=adodata0103.fieldbyname('Rkey').AsInteger ;
       result:=true;
    end;
  finally
    free;
  end;
end;

end.
