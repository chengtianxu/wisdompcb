unit PasProd_Code;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, Buttons, DB, ADODB;

type
  TfrmProd_Code = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    DBGridEh1: TDBGridEh;
    Panel3: TPanel;
    BitBtn3: TBitBtn;
    BitBtn6: TBitBtn;
    ado08: TADOQuery;
    DataSource1: TDataSource;
    Edit5: TEdit;
    Label5: TLabel;
    GroupBox1: TGroupBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Edit1: TEdit;
    BitBtn7: TBitBtn;
    Edit2: TEdit;
    BitBtn1: TBitBtn;
    Edit3: TEdit;
    Edit4: TEdit;
    BitBtn2: TBitBtn;
    procedure FormShow(Sender: TObject);
    procedure Edit3KeyPress(Sender: TObject; var Key: Char);
    procedure DBGridEh1DblClick(Sender: TObject);
    procedure BitBtn7Click(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure DBGridEh1KeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure DBGridEh1TitleClick(Column: TColumnEh);
    procedure Edit1DblClick(Sender: TObject);
    procedure Edit2DblClick(Sender: TObject);
    procedure Edit3DblClick(Sender: TObject);
    procedure Edit4DblClick(Sender: TObject);
    procedure Edit5DblClick(Sender: TObject);
    procedure Edit5Change(Sender: TObject);
    procedure Edit1Exit(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Edit3Change(Sender: TObject);
    procedure Edit4Change(Sender: TObject);
  private
    sSQL,sSQL1,sSQL2,sSQL3,sSQL4:string;
    PreColumn: TColumnEh;
    field_name:string;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmProd_Code: TfrmProd_Code;

implementation

uses
   common   ,Pick_Item_Single   ,ConstVar, DmUnit1;
{$R *.dfm}

procedure TfrmProd_Code.FormShow(Sender: TObject);
begin
  sSQL:=ado08.SQL.Text;//+' order by prod_code';
  ado08.Close;
  ado08.Open;
  field_name := DBGridEh1.Columns[0].FieldName;
  PreColumn := DBGridEh1.Columns[0] ;
  PreColumn.Title.Color := clred ;

end;

procedure TfrmProd_Code.Edit3KeyPress(Sender: TObject; var Key: Char);
begin
  if not (Key in ['0'.. '9',#8]) then Key:=#0;
end;

procedure TfrmProd_Code.DBGridEh1DblClick(Sender: TObject);
begin
  ModalResult:=mrOk;
end;

procedure TfrmProd_Code.BitBtn7Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'category/类别代码/150,category_name/类别名称/300';
    InputVar.Sqlstr := 'select distinct category,category_name from data0619';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit1.Text := frmPick_Item_Single.adsPick.FieldValues['category_name'];
      sSQL1:='';
      if Trim(Edit1.Text)<>'' then
      begin
        sSQL1:=' and category_name like ''%'+ Trim(Edit1.Text)+'%''';
      end;
      ado08.Close;
      ado08.SQL.Text:=sSQL+sSQL1+sSQL2+sSQL3+sSQL4+'  order by prod_code';
      ado08.Open;
    end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmProd_Code.BitBtn1Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'PR_GRP_CODE/产品组代码/150,PRODUCT_GROUP_NAME/产品组名称/300';
    InputVar.Sqlstr := 'select distinct PR_GRP_CODE,PRODUCT_GROUP_NAME from Data0007 where active=1';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit2.Text := frmPick_Item_Single.adsPick.FieldValues['PRODUCT_GROUP_NAME'];
      sSQL2:='';
      if Trim(Edit2.Text)<>'' then
      begin
        sSQL2:=' and PRODUCT_GROUP_NAME like ''%'+ Trim(Edit2.Text)+'%''';
      end;
      ado08.Close;
      ado08.SQL.Text:=sSQL+sSQL1+sSQL2+sSQL3+sSQL4+'  order by prod_code';
      ado08.Open;
    end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmProd_Code.BitBtn2Click(Sender: TObject);
var
  InputVar: PDlgInput ;
begin
  frmPick_Item_Single := TfrmPick_Item_Single.Create(application) ;
  try
    InputVar.Fields := 'difficulty_grade_value/产品阶数/350';
    InputVar.Sqlstr := 'select distinct difficulty_grade_value from Data0008';
    InputVar.AdoConn := DM.ADOConnection1 ;
    frmPick_Item_Single.InitForm_New(InputVar)  ;
    if frmPick_Item_Single.ShowModal=mrok then
    begin
      edit3.Text := frmPick_Item_Single.adsPick.FieldValues['difficulty_grade_value'];
      sSQL3:='';
      if Trim(Edit3.Text)<>'' then
      begin
        sSQL3:=' and difficulty_grade_value ='+ Trim(Edit3.Text)+'';
      end;
      ado08.Close;
      ado08.SQL.Text:=sSQL+sSQL1+sSQL2+sSQL3+sSQL4+'  order by prod_code';
      ado08.Open;
    end;
  finally
      frmPick_Item_Single.adsPick.Close;
      frmPick_Item_Single.Free ;
  end;
end;

procedure TfrmProd_Code.DBGridEh1KeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (chr(key) = 'S') and (ssalt in shift) then
      showmessage(ado08.SQL.Text);
end;

procedure TfrmProd_Code.DBGridEh1TitleClick(Column: TColumnEh);
begin
  if DBGridEh1.DataSource.DataSet.FieldByName(Column.FieldName).FieldKind = fkCalculated then  exit ;
  if (column.Title.SortMarker =smDownEh) or (column.Title.SortMarker =smNoneEh) then
  begin
    column.Title.SortMarker:=smUpEh;
    ado08.Sort:=Column.FieldName;
  end
  else
  begin
    column.Title.SortMarker:=smDownEh;
    ado08.Sort:=Column.FieldName+' DESC';
  end;
  if (PreColumn.FieldName<>column.FieldName) and (Column.Index<2) then
  begin
    Label5.Caption:=column.Title.Caption;
    edit5.SetFocus;
    PreColumn.Title.Color := clBtnFace;
    Column.Title.Color := clred;
    PreColumn := column;
  end
  else edit5.SetFocus;
end;

procedure TfrmProd_Code.Edit1DblClick(Sender: TObject);
begin
  Edit1.Text:='';
end;

procedure TfrmProd_Code.Edit2DblClick(Sender: TObject);
begin
  Edit2.Text:='';
end;

procedure TfrmProd_Code.Edit3DblClick(Sender: TObject);
begin
  Edit3.Text:='';
end;

procedure TfrmProd_Code.Edit4DblClick(Sender: TObject);
begin
  Edit4.Text:='';
end;

procedure TfrmProd_Code.Edit5DblClick(Sender: TObject);
begin
  Edit5.Text:='';
end;

procedure TfrmProd_Code.Edit5Change(Sender: TObject);
begin
  if Trim(Edit5.Text)<>'' then
    ado08.Filter:=preColumn.FieldName+' like ''%'+ Trim(Edit5.Text)+'%'''
  else
    ado08.Filter:='';
end;

procedure TfrmProd_Code.Edit1Exit(Sender: TObject);
begin
  ado08.Close;
  ado08.SQL.Text:=sSQL+sSQL1+sSQL2+sSQL3+sSQL4+'  order by prod_code';
  ado08.Open;
end;

procedure TfrmProd_Code.Edit1Change(Sender: TObject);
begin
  if Trim(Edit1.Text)<>'' then
  begin
    sSQL1:=' and category_name like ''%'+ Trim(Edit1.Text)+'%''';
  end else
  begin
    sSQL1:='';
  end;
end;

procedure TfrmProd_Code.Edit2Change(Sender: TObject);
begin
  if Trim(Edit2.Text)<>'' then
  begin
    sSQL2:=' and PRODUCT_GROUP_NAME like ''%'+ Trim(Edit2.Text)+'%''';
  end else
  begin
    sSQL2:='';
  end;
end;

procedure TfrmProd_Code.Edit3Change(Sender: TObject);
begin
  if Trim(Edit3.Text)<>'' then
  begin
    sSQL3:=' and difficulty_grade_value ='+ Trim(Edit3.Text)+'';
  end else
  begin
    sSQL3:='';
  end;
end;

procedure TfrmProd_Code.Edit4Change(Sender: TObject);
begin
  if Trim(Edit4.Text)<>'' then
  begin
    sSQL4:=' and PROD_INCREMENTBY ='+ Trim(Edit4.Text)+'';
  end else
  begin
    sSQL4:='';
  end;
end;

end.
