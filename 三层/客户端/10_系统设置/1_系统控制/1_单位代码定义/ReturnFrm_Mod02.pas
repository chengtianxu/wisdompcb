unit ReturnFrm_Mod02;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,uBaseMainFrm, DBGridEhGrouping,
  ToolCtrlsEh, DBGridEhToolCtrls, DynVarsEh, Data.DB, Vcl.XPMan, Vcl.Menus,
  Datasnap.DBClient, Vcl.StdCtrls, Vcl.Buttons, EhLibVCL, GridsEh,
  DBAxisGridsEh, DBGridEh, Vcl.ExtCtrls,uBaseEditFrm,Vcl.Mask, RzEdit,
  RzBtnEdt, uRKeyBtnEdit,uCommFunc, Vcl.DBCtrls,uBaseSinglePickListFrm;

type
  TAfterUpdate_Mod02 = procedure(ACds : TClientDataSet) of object;



  TFrmReturn_Mod02 = class(TfrmBaseEdit)

    Label2: TLabel;
    Label3: TLabel;
    ded_code: TEdit;
    ded_name: TEdit;
    dcb_pro: TCheckBox;
    dcb_pur: TCheckBox;
    dcb_save: TCheckBox;
    dcb_sell: TCheckBox;
    cds_02: TClientDataSet;
    procedure btnCloseClick(Sender: TObject);
    procedure btnSaveClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
      Ftag :Integer;
      u_code1 : string;
     // c_code1 : string;
      FAfterUpdate : TAfterUpdate_Mod02;
     procedure getdate(ARkey:string);
     procedure bindingfield;
    { Public declarations }
  end;

var
  FrmReturn_Mod02: TFrmReturn_Mod02;

implementation

{$R *.dfm}

uses MainFrm_Mod02;

procedure TFrmReturn_Mod02.btnCloseClick(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TFrmReturn_Mod02.btnSaveClick(Sender: TObject);
var
  LPostData : OleVariant;
  Lsql : string;
  lcds : TClientDataSet;
begin
  inherited;
   if Trim(ded_code.Text) = '' then
    begin
      ShowMessage('单位代码不能为空!');
      Exit;
    end;
   if Trim(ded_name.Text) = '' then
    begin
      ShowMessage('单位名称不能为空!');
      Exit;
    end;

   Lsql := 'select * from data0002 where UNIT_CODE='+ QuotedStr(Trim(ded_code.Text)) ;
   lcds := TClientDataSet.Create(Self);   //单位代码是否重复
   gSvrIntf.IntfGetDataBySql(Lsql,lcds);
    try
         if Ftag =2 then
          begin
            if u_code1 <> ded_code.Text  then
             begin
               if (not lcds.IsEmpty) then
                begin
                   ShowMessage('货币代码重复');
                   Exit;
                end;
             end ;
          end;
        if (Ftag =1 ) then
          begin
            if (not lcds.IsEmpty) then
              begin
                ShowMessage('货币代码重复');
                Exit;
              end;
          end;
    finally
        lcds.Free;
    end;

    case Ftag of
       1:  //新增
        begin
           cds_02.Append;
           cds_02.FieldByName('unit_code').Value := ded_code.Text;
           cds_02.FieldByName('unit_name').Value := ded_name.Text;
           if dcb_pro.Checked = True then
               cds_02.FieldByName('prod').Value :='Y'
           else
               cds_02.FieldByName('prod').Value :='N';

           if dcb_pur.Checked = True then
               cds_02.FieldByName('purch').Value :='Y'
           else
               cds_02.FieldByName('purch').Value :='N';

           if dcb_save.Checked = True then
               cds_02.FieldByName('stock').Value :='Y'
           else
               cds_02.FieldByName('stock').Value :='N';

           if dcb_sell.Checked = True then
               cds_02.FieldByName('quote').Value :='Y'
           else
               cds_02.FieldByName('quote').Value :='N';
           cds_02.Post;
        end;

       2: //编辑
        begin
           cds_02.Edit;
           cds_02.FieldByName('unit_code').Value := ded_code.Text;
           cds_02.FieldByName('unit_name').Value := ded_name.Text;
           if  dcb_pro.Checked = True then
              cds_02.FieldByName('prod').Value :='Y'
           else
              cds_02.FieldByName('prod').Value :='N';

           if  dcb_pur.Checked = True then
              cds_02.FieldByName('purch').Value :='Y'
           else
              cds_02.FieldByName('purch').Value :='N';

           if  dcb_save.Checked = True then
              cds_02.FieldByName('stock').Value :='Y'
           else
             cds_02.FieldByName('stock').Value :='N';

           if  dcb_sell.Checked = True then
              cds_02.FieldByName('quote').Value :='Y'
           else
              cds_02.FieldByName('quote').Value :='N';
           cds_02.Post;
        end;

    end;

    if cds_02.State in [dsEdit,dsInsert] then cds_02.Post;

    if cds_02.ChangeCount > 0 then
    begin
      if gSvrIntf.IntfPostDataByTable('data0002', cds_02.Delta) then
      begin
        cds_02.MergeChangeLog;
        showmessage('保存成功');
        if Assigned(FAfterUpdate) then
         FAfterUpdate(nil);
        Close;
      end;
    end;


//    LPostData := VarArrayCreate([0,1],varVariant);
//    if cds_02.ChangeCount > 0 then
//        LPostData[0] := cds_02.Delta;
//
//      //IF gSvrIntf.IntfPostDataByTable('data0002',cds_insert.Delta) then
//    if gSvrIntf.IntfPostModData('公共基础',15,LPostData) then
//      begin
//        cds_02.MergeChangeLog;
//        showmessage('保存成功');
//        if Assigned(FAfterUpdate) then
//         FAfterUpdate(nil);
//        Close;
//      end;
end;


procedure TFrmReturn_Mod02.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
    Action := caFree;
    FrmReturn_Mod02 := nil;
end;

procedure TFrmReturn_Mod02.getdate(ARkey: string);
var
  Lsql : string;
begin
    Lsql := 'select * from data0002 where rkey= '+ ARkey;
    gSvrIntf.IntfGetDataBySql(Lsql,cds_02);
end;

procedure TFrmReturn_Mod02.bindingfield;
begin
      FrmReturn_Mod02.ded_code.Text :=cds_02.FieldByName('unit_code').AsString ;
      FrmReturn_Mod02.ded_name.Text := cds_02.FieldByName('unit_name').AsString ;

      if cds_02.FieldByName('prod').Value ='Y'  then
          FrmReturn_Mod02.dcb_pro.Checked := True
      else
          FrmReturn_Mod02.dcb_pro.Checked := False;

      if cds_02.FieldByName('purch').Value ='Y'  then
          FrmReturn_Mod02.dcb_pur.Checked := True
      else
          FrmReturn_Mod02.dcb_pur.Checked := False;

      if cds_02.FieldByName('stock').Value ='Y'  then
          FrmReturn_Mod02.dcb_save.Checked := True
      else
          FrmReturn_Mod02.dcb_save.Checked := False;

      if cds_02.FieldByName('quote').Value ='Y' then
          FrmReturn_Mod02.dcb_sell.Checked := True
      else
          FrmReturn_Mod02.dcb_sell.Checked := False;
end;




end.
