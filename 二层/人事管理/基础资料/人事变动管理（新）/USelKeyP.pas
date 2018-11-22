unit USelKeyP;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, Grids, DBGridEh, StdCtrls, DB, ADODB;

type
  TfrmSelKeyP = class(TForm)
    pnl1: TPanel;
    pnl2: TPanel;
    pnl3: TPanel;
    pnl4: TPanel;
    pnl5: TPanel;
    pnl6: TPanel;
    pnl7: TPanel;
    ehS: TDBGridEh;
    ehTrain: TDBGridEh;
    lbl1: TLabel;
    lbl2: TLabel;
    lbl3: TLabel;
    edt_KeyP: TEdit;
    btn_SelKeyP: TButton;
    ds_s: TDataSource;
    ds_train: TDataSource;
    qry_s: TADOQuery;
    qry_train: TADOQuery;
    wdstrngfld_sreqItem: TWideStringField;
    qry_sSType: TStringField;
    btn_OK: TButton;
    btn_CLose: TButton;
    qry_trainTrain_topics: TWideStringField;
    qry_trainstartT: TStringField;
    qry_trainendT: TStringField;
    qry_trainTrain_grade: TWideStringField;
    qry_trainTrain_result: TWideStringField;
    qry_trainTrain_content: TWideStringField;
    qry_trainTrain_status: TIntegerField;
    lbl4: TLabel;
    edt_WYear: TEdit;
    lbl5: TLabel;
    qry_sIsSelected: TBooleanField;
    procedure btn_CLoseClick(Sender: TObject);
    procedure btn_SelKeyPClick(Sender: TObject);
    procedure btn_OKClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    PDeptid:integer;
    PEmployeeid :integer;
   //PWYear: Double;
  end;

var
  frmSelKeyP: TfrmSelKeyP;

implementation
       uses UDM,Pick_Item_Single, ConstVar, common;
{$R *.dfm}


procedure TfrmSelKeyP.btn_CLoseClick(Sender: TObject);
begin
close;
end;

procedure TfrmSelKeyP.btn_SelKeyPClick(Sender: TObject);
   var
     InputVar:PDlginput;
     Lsql:string;
 begin
   try
      frmPick_Item_Single := TfrmPick_Item_Single.Create(nil) ;

        InputVar.Fields := 'positionname/关键岗位名称/120,qty_req/需求人数/100,qty_has/已有人数/100,rkey/ID/50';
        InputVar.Sqlstr := ' select  positionname,qty_req,qty_has,rkey as id from hr_keyposition  where deptid='+inttostr(PDeptid)+' ';
        InputVar.AdoConn :=dm.con1;
        frmPick_Item_Single.InitForm_New(InputVar) ;
        if frmPick_Item_Single.ShowModal=mrok then
        begin
          edt_KeyP.text:=frmPick_Item_Single.adsPick.fieldbyname('positionname').asstring;
          edt_KeyP.tag:= frmPick_Item_Single.adsPick.fieldbyname('ID').AsInteger;

         //带出对的标准和相关的培训
         qry_s.close;
         qry_s.Parameters[0].value:=edt_KeyP.tag;
         qry_s.open;

         qry_train.Close;
         qry_train.Parameters[0].Value:=PEmployeeid;
         qry_train.Parameters[1].Value:=edt_KeyP.tag;
         qry_train.open;
        end;

  finally
   frmPick_Item_Single.Free;

  end;
end;

procedure TfrmSelKeyP.btn_OKClick(Sender: TObject);

begin

//  if not qry_s.IsEmpty then
//  begin
//   qry_s.First;
//   while  not qry_s.Eof do
//   begin
//   if qry_s.FieldByName('IsSelected').Value=0  then
//   begin
//    ShowMessage('请确认以下标准是否符合，符合请都打V，否则不能变更！');
//   exit;
//   end;
//   qry_s.Next;
//   end;
//  end;

  self.ModalResult:=mrok;


end;

end.
