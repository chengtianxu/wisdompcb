unit SelectedFrm_Mod63;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, DBGridEhGrouping, ToolCtrlsEh,
  DBGridEhToolCtrls, DynVarsEh, Data.DB, Datasnap.DBClient, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh , uCommFunc, Data.Win.ADODB, Datasnap.Provider,
  Vcl.StdCtrls, Vcl.ExtCtrls, uBaseSinglePickListFrm;

type
  TFrmSelected_Mod63 = class(TForm)
    cds496: TClientDataSet;
    ds496: TDataSource;
    cds496checked: TBooleanField;
    cds496rKey: TAutoIncField;
    cds496Dept_Code: TStringField;
    cds496Dept_Name: TStringField;
    Panel1: TPanel;
    Panel2: TPanel;
    Panel3: TPanel;
    DBGridEh1: TDBGridEh;
    labelKey: TLabel;
    edtKey: TEdit;
    CheckBox1: TCheckBox;
    OKBtn: TButton;
    CancelBtn: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure edtKeyChange(Sender: TObject);
  private
    PreColumn:TColumnEh;
    function UpdateValueToField(pDataSet:TDataSet;value:variant;FieldName:string):boolean;//更新数据表某个字段数值
    { Private declarations }
  public
    procedure GetRkey();
    { Public declarations }
  end;

var
  FrmSelected_Mod63: TFrmSelected_Mod63;

implementation

{$R *.dfm}

{ TForm1 }

procedure TFrmSelected_Mod63.CheckBox1Click(Sender: TObject);
begin
  UpdateValueToField(cds496,checkbox1.Checked,'checked');
end;

procedure TFrmSelected_Mod63.edtKeyChange(Sender: TObject);
begin
  if Trim(edtKey.Text) <> '' then
    DBGridEh1.DataSource.DataSet.Filter := PreColumn.FieldName+' like ''%'+trim(edtKey.text)+'%'''
  else
    dbgrideh1.DataSource.DataSet.Filter:='';
end;

procedure TFrmSelected_Mod63.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  inherited;
  canclose:=true;
  if Modalresult = mrok then
  begin
    try
      cds496.DisableControls;
      cds496.Filtered := false;
      cds496.Filter := 'checked=1';
      cds496.Filtered := true;

      if cds496.IsEmpty then
      begin
        ShowMessage('请选择物料');
        canclose:= false;
        cds496.Filter:='';
        cds496.Filtered := false;
        exit;
      end;
    finally
      cds496.EnableControls;
    end;
  end;
end;

procedure TFrmSelected_Mod63.GetRkey;
var
  Lsql496 : string;
begin
  Lsql496 := '  select Tier3_checked.checked , rKey,upper(group_name) as Dept_Code,'+
             ' upper(group_desc)+'' '' as Dept_Name from Data0496 left join Tier3_checked on 1=1 order by Dept_Code';
  if not gSvrIntf.IntfGetDataBySql(Lsql496,cds496) then Exit;
  DBGridEh1.Columns[1].Title.SortMarker := smDownEh ;
//  DBGridEh1.Columns[1].Title.Color := clRed;
  PreColumn:=DBGridEh1.Columns[1];
end;

function TFrmSelected_Mod63.UpdateValueToField(pDataSet: TDataSet;
  value: variant; FieldName: string): boolean;
var
  BookMark:Tbookmark;
begin
  try
    BookMark:=pDataSet.GetBookmark;
    pDataSet.EnableControls;
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

end.
