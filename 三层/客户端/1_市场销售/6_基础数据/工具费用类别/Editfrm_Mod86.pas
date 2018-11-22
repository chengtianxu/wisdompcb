unit Editfrm_Mod86;

interface

uses

  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Mask, RzEdit, RzBtnEdt, uBaseEditFrm,
  uRKeyBtnEdit, Vcl.StdCtrls, Vcl.ExtCtrls, Data.DB, Datasnap.DBClient,uCommFunc,
  Vcl.Buttons,uBaseSinglePickListFrm;
type
  TAfterUpdate_Mod86 = procedure(ACds : TClientDataSet) of object;
  TEditfrm_Mod086 = class(TfrmBaseEdit)
    Label2: TLabel;
    Label3: TLabel;
    dcb_pro: TCheckBox;
    dcb_pur: TCheckBox;
    cds_86: TClientDataSet;
    ded_code: TEdit;
    Label1: TLabel;
    cds86: TDataSource;
    RzButtonEdit1: TRzButtonEdit;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnSaveClick(Sender: TObject);
    procedure btnCloseClick(Sender: TObject);
    procedure RKeyRzBtnEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1ButtonClick(Sender: TObject);
    procedure RzButtonEdit1KeyPress(Sender: TObject; var Key: Char);
  private
    { Private declarations }
  public
  u_code1,Frkey86 : string;
  Ftag :Integer;
  FAfterUpdate : TAfterUpdate_Mod86;
    procedure getdate(ARkey:string);

    { Public declarations }
  end;

var
  Editfrm_Mod086: TEditfrm_Mod086;

implementation
 uses
  Mainfrm_Mod086;
{$R *.dfm}

procedure TEditfrm_Mod086.btnCloseClick(Sender: TObject);
begin
  inherited;
Close;
end;


procedure TEditfrm_Mod086.btnSaveClick(Sender: TObject);
var
  LPostData : OleVariant;
  Lsql : string;
  lcds : TClientDataSet;
begin
  inherited;

     if Trim(ded_code.Text)='' then
     begin
     ShowMessage('类别不能为空！');
     exit;
     end;

    Lsql := 'select * from data0061 where CATEGORY='+ QuotedStr(Trim(ded_code.Text)) ;
   lcds := TClientDataSet.Create(Self);   //名称是否重复
   gSvrIntf.IntfGetDataBySql(Lsql,lcds);
   try
         if Ftag =2 then
          begin
            if u_code1 <> ded_code.Text  then
             begin
               if (not lcds.IsEmpty) then
                begin
                   ShowMessage('类别名称重复');
                   Exit;
                end;
             end ;
          end;
        if (Ftag =1 ) then
          begin
            if (not lcds.IsEmpty) then
              begin
                ShowMessage('类别名称重复');
                Exit;
              end;
          end;
    finally
        lcds.Free;
    end;
   case Ftag of
       1:  //新增
        begin
           cds_86.Append;
           cds_86.FieldByName('CATEGORY').Value := ded_code.Text;

           if dcb_pro.Checked = True then
               cds_86.FieldByName('TAX_FLAG').Value :='Y'
           else
               cds_86.FieldByName('TAX_FLAG').Value :='N';

           if dcb_pur.Checked = True then
               cds_86.FieldByName('COMMISSION_FLAG').Value :='Y'
           else
               cds_86.FieldByName('COMMISSION_FLAG').Value :='N';
           cds_86.Post;
        end;

       2: //编辑
        begin
           cds_86.Edit;
           cds_86.FieldByName('CATEGORY').Value := ded_code.Text;
           if  dcb_pro.Checked = True then
              cds_86.FieldByName('TAX_FLAG').Value :='Y'
           else
              cds_86.FieldByName('TAX_FLAG').Value :='N';

           if  dcb_pur.Checked = True then
              cds_86.FieldByName('COMMISSION_FLAG').Value :='Y'
           else
              cds_86.FieldByName('COMMISSION_FLAG').Value :='N';
           cds_86.Post;
        end;

    end;
   if cds_86.State in [dsEdit,dsInsert] then cds_86.Post;
     if  gSvrintf.IntfPostDataByTable('data0061', cds_86.Delta) then
     begin
     cds_86.MergeChangeLog;
     showmessage('保存成功');
     ModalResult:=mrok;
     end;


end;


procedure TEditfrm_Mod086.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    Action := caFree;
    Editfrm_Mod086:= nil;
end;
procedure TEditfrm_Mod086.getdate(ARkey: string);
var
  Lsql : string;
begin
    Lsql := 'SELECT * FROM  Data0061  where rkey= '+ ARkey;

   gSvrIntf.IntfGetDataBySql(Lsql,cds_86);
end;




procedure TEditfrm_Mod086.RzButtonEdit1ButtonClick(Sender: TObject);
var
  LFrm:TfrmSinglePickList;
begin
  inherited;
   LFrm := TfrmSinglePickList.Create(Self);
  try
    LFrm.InitWithPickID(63,3);
    if LFrm.ShowModal = mrOk then
    begin
      RzButtonEdit1.Text := LFrm.cdsPick.FieldByName('GL_ACC_NUMBER').AsString;
    end;
  finally
    LFrm.Free;
  end;
end;

procedure TEditfrm_Mod086.RzButtonEdit1KeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
Key := #0;
end;

end.
