unit qk20001MainFrm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, qkBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS,
  FireDAC.Phys.Intf, FireDAC.DApt.Intf, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.StdCtrls, Vcl.Mask, RzEdit, RzButton, RzLabel,
  EhLibVCL, GridsEh, DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls, RzPanel,
  qkSvrIntf.ClientIntf,qkFunc.Commfunc,qkBaseEditVGridFrm, Vcl.Menus;

type
  Tfrmqk20001Main = class(TfrmqkBaseMain)
    procedure mniNewClick(Sender: TObject);
    procedure mniEditClick(Sender: TObject);
    procedure mniDeleClick(Sender: TObject);
    procedure mniViewClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;


implementation

uses
  qk20001EditFrm;

{$R *.dfm}

procedure Tfrmqk20001Main.mniDeleClick(Sender: TObject);
const
  TBNAME = 'gSys_SqlTxt';
begin
  inherited;
  if qkDialog.DeleConfig then
  begin
    DataSet.Delete;
    if dmSvrIntf.PostDataByTable(DataSet,TBNAME) then
    begin
      qkDialog.DeleSucc;
    end else
    DataSet.Cancel;
  end;
end;

procedure Tfrmqk20001Main.mniEditClick(Sender: TObject);
const
  TBNAME = 'gSys_SqlTxt';
  EDITGRIDIDKEY = 20001;
var
  Lds: TFDMemTable;
begin
  inherited;
  if Assigned(frmqk20001Edit) then
    FreeAndNil(frmqk20001Edit);

  frmqk20001Edit := Tfrmqk20001Edit.Create(Self);
  frmqk20001Edit.InitGrid(EDITGRIDIDKEY);
  //--clonecur
  Lds := qkCommfunc.CreateDS(frmqk20001Edit);
//  Lds.CloneCursor(FMainFrm.DataSet,True,False);
  qkDataIntf.GetTableData(Lds,TBNAME,' IDKey = ' + DataSet.FieldByName('IDKey').AsLargeInt.ToString);
  Lds.MergeChangeLog;
  Lds.Locate('IDKey',DataSet.FieldByName('IDkey').AsLargeInt,[]);
  frmqk20001Edit.DataSet := Lds;
  //--

  //--Post
  frmqk20001Edit.PostDsList.Add(Lds);
  frmqk20001Edit.PostTableArr := TBNAME;
  //--
  frmqk20001Edit.Show;
end;

procedure Tfrmqk20001Main.mniNewClick(Sender: TObject);
const
  TBNAME = 'gSys_SqlTxt';
  EDITGRIDIDKEY = 20001;
var
  Lds: TFDMemTable;
begin
  inherited;
  if Assigned(frmqk20001Edit) then
    FreeAndNil(frmqk20001Edit);

  frmqk20001Edit := Tfrmqk20001Edit.Create(Self);
  frmqk20001Edit.InitGrid(EDITGRIDIDKEY);
  //--clonecur
  Lds := qkCommfunc.CreateDS(frmqk20001Edit);
  qkDataIntf.GetTableData(Lds,TBNAME,' IDKey = 0');
  frmqk20001Edit.DataSet := Lds;
  //Lds.Last;
  Lds.Append;
  //--

  //--Post
  frmqk20001Edit.PostDsList.Add(Lds);
  frmqk20001Edit.PostTableArr := TBNAME;
  //--
  frmqk20001Edit.Show;
end;

procedure Tfrmqk20001Main.mniViewClick(Sender: TObject);
const
  TBNAME = 'gSys_SqlTxt';
  EDITGRIDIDKEY = 20001;
var
  Lds: TFDMemTable;
begin
  inherited;
  if Assigned(frmqk20001Edit) then
    FreeAndNil(frmqk20001Edit);

  frmqk20001Edit := Tfrmqk20001Edit.Create(Self);
  frmqk20001Edit.InitGrid(EDITGRIDIDKEY);
  //--clonecur
  Lds := qkCommfunc.CreateDS(frmqk20001Edit);
//  Lds.CloneCursor(FMainFrm.DataSet,True,False);
  qkDataIntf.GetTableData(Lds,TBNAME,' IDKey = ' + DataSet.FieldByName('IDKey').AsLargeInt.ToString);
  Lds.MergeChangeLog;
  Lds.Locate('IDKey',DataSet.FieldByName('IDkey').AsLargeInt,[]);
  frmqk20001Edit.DataSet := Lds;
  //--

  //--Post
  frmqk20001Edit.PostDsList.Add(Lds);
  frmqk20001Edit.PostTableArr := TBNAME;
  //--
  frmqk20001Edit.SetReadOnly;
  frmqk20001Edit.Show;
end;

end.
