unit formWorkRecord03;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, MC, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  Menus, ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider,
  ADODB, dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin,
  ComCtrls, cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, Mask, DBCtrlsEh;

type
  TfrmWorkRecord03 = class(TMC_f)
    cdsMainrkey: TAutoIncField;
    cdsMainCDSDesigner: TStringField;
    cdsMainCDSDesigner2: TStringField;
    cdsMainCDSDesigner3: TStringField;
    cdsMainCDSDesigner4: TStringField;
    cdsMainCDSDesigner5: TStringField;
    Label1: TLabel;
    Button2: TButton;
    Button3: TButton;
    CheckBox1: TCheckBox;
    DBDateTimeEditEh1: TDBDateTimeEditEh;
    cdsChildselected: TBooleanField;
    cdsChildCDSDesigner: TDateTimeField;
    cdsChildCDSDesigner2: TDateTimeField;
    cdsChildCDSDesigner3: TDateTimeField;
    cdsChildCDSDesigner4: TStringField;
    cdsChildCDSDesigner5: TStringField;
    cdsChildWork_ptr: TIntegerField;
    dtChildselected: TBooleanField;
    dtChildDSDesigner: TDateTimeField;
    dtChildDSDesigner2: TDateTimeField;
    dtChildDSDesigner3: TDateTimeField;
    dtChildDSDesigner4: TStringField;
    dtChildDSDesigner5: TStringField;
    dtChildWork_ptr: TIntegerField;
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    procedure RightsSetDataSetReadOnly;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmWorkRecord03: TfrmWorkRecord03;

implementation

uses PublicFile;

{$R *.dfm}
procedure TfrmWorkRecord03.RightsSetDataSetReadOnly;
begin
  cdsMain  .ReadOnly:=True;
  DghMain  .ReadOnly:=True;
  if (StrToInt(vprev) in [2,3,4]) then    //
  begin
    cdsChild .ReadOnly:=False;
  end
  else
  begin
    cdsChild .ReadOnly:=True;
  end  ;
  if (StrToInt(vprev) in [2,4]) then    //
  begin
    dghChild .ReadOnly:=False;
  end
  else
  begin
    dghChild .ReadOnly:=True;
  end ;
end;
procedure TfrmWorkRecord03.Button2Click(Sender: TObject);
begin
  inherited;
  if VarIsNull(DBDateTimeEditEh1.Value) then
  begin
    MsgInfo('请输入“工作日期”！！！');
    Exit;
  end;
  ModalResult:=mrOk;
end;

procedure TfrmWorkRecord03.Button3Click(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TfrmWorkRecord03.CheckBox1Click(Sender: TObject);
var
  BM:Pointer;//TBookmark;
begin
  with dghChild.DataSource.DataSet do
  begin
    bm:=GetBookmark;//书签。
    try
      DisableControls;
      Screen.Cursor := crHourGlass;
      First;
      while not Eof do
      begin
        Edit;
        if (Sender as  TCheckBox).Checked then
          FieldByName('selected').Value:=True
        else
          FieldByName('selected').Value:=False;
        Next;
      end;
      GotoBookmark(BM);  // 重新定位到书签
    finally
      FreeBookmark(bm ); //释放书签。
      EnableControls ;
      Screen.Cursor := crDefault;
    end;
  end;
end;

procedure TfrmWorkRecord03.FormShow(Sender: TObject);
begin
  inherited;
  CheckBox1.Checked:=False;


end;

procedure TfrmWorkRecord03.FormCreate(Sender: TObject);
begin
  inherited;
  NeedSave:=False;
end;

end.
