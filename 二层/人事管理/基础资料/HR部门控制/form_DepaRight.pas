unit form_DepaRight;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter, ppDB,
  ppDBPipe, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppRelatv, ppProd,
  ppReport, ppComm, ppEndUsr, dxBar, cxClasses, ImgList, ActnList, DB,
  DBClient, cds, Provider, ADODB, Grids, DBGridEh, ToolWin, ComCtrls, cxPC,
  StdCtrls, RzPanel, ExtCtrls, dxStatusBar, EditBit, Buttons, Menus, Mask,
  RzEdit, RzBtnEdt, ButtonEdit;

type
  Tfrm_DepaRight = class(TSingleDataSet_f)
    pnl_user: TPanel;
    Label1: TLabel;
    edt_USER_LOGIN_NAME_DELETE: TEditBit;
    edt_USER_FULL_NAME: TEdit;
    cds0073: TClientDataSet;
    cds0073USER_LOGIN_NAME: TStringField;
    cds0073USER_FULL_NAME: TStringField;
    cds0073rkey: TIntegerField;
    cdsMainDESCRIPTION: TStringField;
    cdsMainPROGRAME: TStringField;
    cdsMainoperator_ptr: TIntegerField;
    cdsMaindepartmentid: TIntegerField;
    cdsMainprogram_ptr: TIntegerField;
    dtMainDESCRIPTION: TStringField;
    dtMainPROGRAME: TStringField;
    dtMainoperator_ptr: TIntegerField;
    dtMaindepartmentid: TIntegerField;
    dtMainprogram_ptr: TIntegerField;
    pnl_DEPT: TPanel;
    Label2: TLabel;
    edt_departmentcode_delete: TEditBit;
    edt_departmentname: TEdit;
    cds419: TClientDataSet;
    cdsDataDepartment: TClientDataSet;
    cds419rkey: TIntegerField;
    cds419DESCRIPTION: TStringField;
    cds419PROGRAME: TStringField;
    pnl_but: TPanel;
    RadioGroup1: TRadioGroup;
    pnl_DESCRIPTION: TPanel;
    Label4: TLabel;
    edt_DESCRIPTION_delete: TEditBit;
    edt_PROGRAME: TEdit;
    BtFind: TSpeedButton;
    dtMainUSER_LOGIN_NAME: TStringField;
    dtMainUSER_FULL_NAME: TStringField;
    cdsMainUSER_LOGIN_NAME: TStringField;
    cdsMainUSER_FULL_NAME: TStringField;
    cdsDataDepartmentrkey: TIntegerField;
    cdsDataDepartmentdepartmentname: TWideStringField;
    cdsDataDepartmentdepartmentcode: TWideStringField;
    dtMaindepartmentname: TWideStringField;
    dtMaindepartmentcode: TWideStringField;
    cdsMaindepartmentname: TWideStringField;
    cdsMaindepartmentcode: TWideStringField;
    cds0073_1: TClientDataSet;
    BooleanField1: TBooleanField;
    StringField1: TStringField;
    StringField2: TStringField;
    IntegerField1: TIntegerField;
    cdsDataDepartment_1: TClientDataSet;
    BooleanField2: TBooleanField;
    IntegerField2: TIntegerField;
    WideStringField1: TWideStringField;
    WideStringField2: TWideStringField;
    cds419_1: TClientDataSet;
    BooleanField3: TBooleanField;
    IntegerField3: TIntegerField;
    StringField3: TStringField;
    StringField4: TStringField;
    cds0073_1dept_code: TStringField;
    cds0073_1dept_name: TStringField;
    Button2: TButton;
    edt_USER_LOGIN_NAME: TButtonEdit;
    edt_departmentcode: TButtonEdit;
    edt_DESCRIPTION: TButtonEdit;
    cds0073_DELETE: TClientDataSet;
    BooleanField4: TBooleanField;
    StringField5: TStringField;
    StringField6: TStringField;
    IntegerField4: TIntegerField;
    cdsDataDepartment_delete: TClientDataSet;
    BooleanField5: TBooleanField;
    IntegerField5: TIntegerField;
    WideStringField3: TWideStringField;
    WideStringField4: TWideStringField;
    cds419_delete: TClientDataSet;
    BooleanField6: TBooleanField;
    IntegerField6: TIntegerField;
    StringField7: TStringField;
    StringField8: TStringField;
    procedure FormCreate(Sender: TObject);
    procedure actAddExecute(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure edt_DESCRIPTION_deleteChange(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure edt_USER_FULL_NAMEChange(Sender: TObject);
  private
  //  function DeleteSaveData():Boolean;   override;
    procedure SetToolbarButtonStatus(Flag: Boolean);  override;
    procedure RightsSetDataSetReadOnly;override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DepaRight: Tfrm_DepaRight;

implementation

uses DM_f,   PublicFile, form_DepaRight1, formSelectMultiItem;

{$R *.dfm}

procedure Tfrm_DepaRight.RightsSetDataSetReadOnly;
begin
  if (StrToInt(vprev) in [2,3,4]) then    //
  begin
    cdsMain.ReadOnly:=False;
    //DghMain.ReadOnly:=False;
  end
  else
  begin
    cdsMain.ReadOnly:=True;
    
  end;
   DghMain.ReadOnly:=True;
end;
    {
function Tfrm_DepaRight.DeleteSaveData():Boolean;
var
  s,i:integer;
begin
  with cdsMain  do
  if Active and (not IsEmpty) then
   begin
//     s:=messagebox(Self.Handle,'你确定要删除吗?删除后将不能恢复！','询问',MB_YESNO+MB_iconquestion) ;
//     if S = idyes  then
     begin
       with DghMain do
       begin
         if SelectedRows.Count >1 then  //如果用户选择的行数大于1，即多行。
           begin
             try
               F_IsBatchOperating:=True;  //如果选择的是多行，即多行一起删除，将状态FIsBatchOperating设置为真
               with   DataSource.DataSet   do
               for i:= SelectedRows.Count -1 downto 0 do
               begin
               GotoBookmark(pointer(SelectedRows.Items[i]));
               Delete;        //删除多行。
               end;
             finally
               F_IsBatchOperating:=False;   //删除结束后，复位
             end;
           end
         else
           DataSource.DataSet.Delete; //否则用户选择的是单行，删除。
       end ;
     end;
   end;
   dsMainStateChange(dsMain);     
end;   }

procedure Tfrm_DepaRight.SetToolbarButtonStatus(Flag: Boolean);
begin
  dxBarManager.LockUpdate:=True;
  with cdsMain   do
  begin
    tblEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    actEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4]);

    tblDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);
    actDelete.Enabled:=( Flag)and(IsEmpty=False) and (StrToInt(vprev)in [2,4]);

    if ((State  in [dsEdit,dsInsert])or(ChangeCount>0)) then
      begin
        tblAdd.Enabled:=False;
        actAdd.Enabled:=False;
        tblSave.Enabled:=True and(StrToInt(vprev)in [2,4]) ;
        actSave.Enabled:=True and(StrToInt(vprev)in [2,4]);
        tblCancel.Enabled:=True;
        actCancel.Enabled:=True;
        tblfind.Enabled:=False;
        actFind.Enabled:= False;
        tblRefresh.Enabled:=False;
        actRefresh .Enabled:= False;
        tblExport.Enabled:=False;
        actExport.Enabled:=False; //导出
        tblExit.Enabled:=False;   //退出
        tblPrint.Enabled:= False;      //打印
        tblDesign.Enabled:=False ;      //报表设计
        tblFilter.Enabled:= False;
        tblReject.Enabled:=False ;   //反提交
        tblExpand.Enabled:=False ;   //提交
        tblConfirm.Enabled:=False;   //审核
        tblUConfirm.Enabled:=False;  //反审核
        edt_USER_LOGIN_NAME.F_AllowPop:=False;
        edt_departmentcode .F_AllowPop:=False;
        edt_DESCRIPTION    .F_AllowPop:=False;
      end
    else
      begin
        tblAdd.Enabled:=True and (StrToInt(vprev)in [2,4]);
        actAdd.Enabled:=True and (StrToInt(vprev)in [2,4]);
        tblCancel.Enabled:=False;
        actCancel.Enabled:=False;
        tblSave.Enabled:=False;
        actSave.Enabled:=False;
        tblfind.Enabled:= True;
        actFind.Enabled:= True;
        tblRefresh .Enabled:=True;
        actRefresh .Enabled:=True;
        tblExport.Enabled:=True and(StrToInt(vprev)in [2,4]);
        actExport.Enabled:=True and(StrToInt(vprev)in [2,4]);
        tblExit.Enabled:=True;
        tblPrint.Enabled:= True   and (StrToInt(vprev)in [2,4]);      //打印
        tblDesign.Enabled:=True   and (StrToInt(vprev)in [2,4]) ;      //报表设计
        tblFilter.Enabled:= True;
        tblReject.Enabled:=True   and (StrToInt(vprev)in [2,4])  ;   //反提交
        tblExpand.Enabled:=True   and (StrToInt(vprev)in [2,4])  ;   //提交
        tblConfirm.Enabled:=True  and (StrToInt(vprev)in [2,4]);   //审核
        tblUConfirm.Enabled:=True and (StrToInt(vprev)in [2,4]);  //反审核
        edt_USER_LOGIN_NAME.F_AllowPop:=True;
        edt_departmentcode.F_AllowPop:=True;
        edt_DESCRIPTION.F_AllowPop:=True;
      end ;
  end;

  with cdsMain do
  begin
    if  Eof  then
    begin
    tblNext.Enabled:=False ;
    tblLast.Enabled:=False ;
    end
    else
    begin
    tblNext.Enabled:=True ;
    tblLast.Enabled:=True ;
    end;

    if  Bof  then
    begin
    tblPrior.Enabled:=False     ;
    tblFirst.Enabled:=False     ;
    end
    else
    begin
    tblPrior.Enabled:=True     ;
    tblFirst.Enabled:=True     ;
    end;
  end;

  if tblExit.Enabled then
     actClose.ImageIndex:=102
  else
     actClose.ImageIndex:=107;

  if tblAdd.Enabled then
     actAdd.ImageIndex:=3
  else
     actAdd.ImageIndex:=58;

  if tblEdit.Enabled then
     actEdit.ImageIndex:=4
  else
     actEdit.ImageIndex:=62;

  if tblSave.Enabled then
     actSave.ImageIndex:=137
  else
     actSave.ImageIndex:=60; // 60

  if tblCancel.Enabled then
     actCancel.ImageIndex:=5
  else
     actCancel.ImageIndex:=55;

  if tblDelete.Enabled then
     actDelete.ImageIndex:=6
  else
     actDelete.ImageIndex:=57;

  if tblFind.Enabled then
     actFind.ImageIndex:=17
  else
     actFind.ImageIndex:=64;

  if tblRefresh.Enabled then
     actRefresh.ImageIndex:=103
  else
     actRefresh.ImageIndex:=106;

  if tblFirst.Enabled then
     actFirst.ImageIndex:=99
  else
     actFirst.ImageIndex:=96;

  if tblPrior.Enabled then
     actPrior.ImageIndex:=95
  else
     actPrior.ImageIndex:=94;

  if tblNext.Enabled then
     actNext.ImageIndex:=100
  else
     actNext.ImageIndex:=101;

  if tblLast.Enabled then
     actlast.ImageIndex:=97
  else
     actLast.ImageIndex:=98;

  if tblDesign.Enabled then
     actDesign.ImageIndex:=127
  else
     actDesign.ImageIndex:=132;

  if tblExpand.Enabled then
     actExpand.ImageIndex:=131
  else
     actExpand.ImageIndex:=135;


  if tblReject.Enabled then
     actReject.ImageIndex:=130
  else
     actReject.ImageIndex:=136;

  if tblPrint.Enabled then
     actPrint.ImageIndex:=19
  else
     actPrint.ImageIndex:=66;

  if tblExport.Enabled then   //导出EXCEL按钮
     actExport.ImageIndex:=119
  else
     actExport.ImageIndex:=120;

  if tblCancelFilter.Enabled then
     actCancelFilter.ImageIndex:= 128
  else
     actCancelFilter.ImageIndex:=133;

  if tblFilter.Enabled then
     actFilter.ImageIndex:=    129
  else
     actFilter.ImageIndex:= 134;

  if tblConfirm.Enabled then
     actConfirm.ImageIndex:=114
  else
     actConfirm.ImageIndex:= 116; //actUConfirm

  if tblUConfirm.Enabled then
     actUConfirm.ImageIndex:=115
  else
     actUConfirm.ImageIndex:= 117;

  dxBarManager.LockUpdate:=False;
end;

procedure Tfrm_DepaRight.FormCreate(Sender: TObject);
begin     
  if not App_init_2(dm.ADOConnection1 ) then
  begin
    ShowMessage('程序启动失败，请联系系统管理员！');
    application.Terminate;
    exit;
  end;  
  Caption  := application.Title ;{ }

{   dm.ADOConnection1.Close;
  dm.ADOConnection1.ConnectionString:='Provider=SQLOLEDB.1;Password=wisdomtopcb1077;Persist Security Info=True;User ID=wzsa;Initial Catalog=sj_v20_live;Data Source=172.16.68.8';
  dm.ADOConnection1.Open;
  UserRKEY := 2522;
  vprev:='2';    }
  
  inherited;
  cdsMain.Open;
  SetEmployeeInfo(dtRead,dxStatusBar1);
  pnl_user.BevelOuter:=  bvNone;
  pnl_DEPT.BevelOuter:=  bvNone;
  pnl_DESCRIPTION.BevelOuter:=  bvNone;
end;

procedure Tfrm_DepaRight.actAddExecute(Sender: TObject);
begin
 // inherited;
  if RadioGroup1.ItemIndex=0 then    //用户/部门
  begin
    if (Trim(edt_USER_LOGIN_NAME.Text)='')or(Trim(edt_departmentcode.Text)='') then
    begin
      ShowMessage('用户或部门不能为空！！！');
      Exit;
    end;
    cds419_1.Close;
    cds419_1.Params.ParamByName('vOperator_ptr').Value:=edt_USER_LOGIN_NAME.F_rkey;;
    cds419_1.Params.ParamByName('vDepartmentid').Value:=edt_departmentcode.F_rkey;
    cds419_1.Open;

    if ShowfrmSelectMultiItem(Self, cds419_1,'DESCRIPTION')then
    begin
      try
        Screen.Cursor := crHourGlass;
        cdsMain.F_IsBatchOperating:=True;
        with cds419_1 do
        begin
          
          First;
          while not Eof do
          begin
            if FieldByName('selected').AsBoolean then
            begin
              cdsMain.Append;
              cdsMain.FieldByName('operator_ptr').Value:= edt_USER_LOGIN_NAME.F_rkey;
              cdsMain.FieldByName('departmentid').Value:= edt_departmentcode.F_rkey;
              cdsMain.FieldByName('program_ptr').Value:= FieldByName('rkey').Value;
              cdsMain.FieldByName('DESCRIPTION').Value:= FieldByName('DESCRIPTION').Value;
              cdsMain.FieldByName('PROGRAME').Value:= FieldByName('PROGRAME').Value;
              cdsMain.FieldByName('USER_LOGIN_NAME').Value:= edt_USER_LOGIN_NAME.Text;
              cdsMain.FieldByName('USER_FULL_NAME').Value:= edt_USER_FULL_NAME.Text;
              cdsMain.FieldByName('departmentcode').Value:= edt_departmentcode.Text;
              cdsMain.FieldByName('departmentname').Value:= edt_departmentname.Text;
              cdsMain.Post;
            end;
            Next;
          end;
        end;
      finally
        cdsMain.F_IsBatchOperating:=False;
        Screen.Cursor := crDefault;
        dsMainStateChange(dsMain);
      end;
    end;
  end
  else
  if RadioGroup1.ItemIndex=1 then   // 用户/程序   
  begin
    if (Trim(edt_USER_LOGIN_NAME.Text)='')or(Trim(edt_DESCRIPTION.Text)='') then
    begin
      ShowMessage('用户或程序不能为空！！！'); // 部门
      Exit;
    end;
    with cdsDataDepartment_1 do
    begin
      Close;
      Params.ParamByName('vOperator_ptr').Value:=edt_USER_LOGIN_NAME.F_rkey;
      Params.ParamByName('vProgram_ptr').Value:=edt_DESCRIPTION.F_rkey;
      Open;
    end;

    if ShowfrmSelectMultiItem(Self, cdsDataDepartment_1,'departmentcode')then
    begin
      try
        cdsMain.F_IsBatchOperating:=True;
        Screen.Cursor := crHourGlass;
        with cdsDataDepartment_1 do
        begin
          First;
          while not Eof do
          begin
            if FieldByName('selected').AsBoolean then
            begin
              cdsMain.Append;
              cdsMain.FieldByName('operator_ptr').Value:= edt_USER_LOGIN_NAME.F_rkey;
              cdsMain.FieldByName('departmentid').Value:= FieldByName('rkey').Value;
              cdsMain.FieldByName('program_ptr').Value:= edt_DESCRIPTION.F_rkey;
              cdsMain.FieldByName('departmentcode').Value:= FieldByName('departmentcode').Value;
              cdsMain.FieldByName('departmentname').Value:= FieldByName('departmentname').Value;
              cdsMain.FieldByName('DESCRIPTION').Value:= edt_DESCRIPTION.Text;
              cdsMain.FieldByName('PROGRAME').Value:= edt_PROGRAME.Text;
              cdsMain.FieldByName('USER_LOGIN_NAME').Value:= edt_USER_LOGIN_NAME.Text;
              cdsMain.FieldByName('USER_FULL_NAME').Value:= edt_USER_FULL_NAME.Text;
              cdsMain.Post;
            end;
            Next;
          end;
          CancelUpdates;  //将原勾选的记录全部取消
        end;

      finally
        cdsMain.F_IsBatchOperating:=False;
        Screen.Cursor := crDefault;
        dsMainStateChange(dsMain);
      end;
    end;
  end
  else
  if RadioGroup1.ItemIndex=2 then   //     部门/程序
  begin
    if (Trim(edt_departmentcode.Text)='')or(Trim(edt_DESCRIPTION.Text)='') then
    begin
      ShowMessage('部门或程序不能为空！！！'); // 部门
      Exit;
    end;
    with cds0073_1 do
    begin
      Close;
      Params.ParamByName('vDepartmentid').Value:=edt_departmentcode.F_rkey;;
      Params.ParamByName('vProgram_ptr').Value:=edt_DESCRIPTION.F_rkey;
      Open;
    end;

    if ShowfrmSelectMultiItem(Self, cds0073_1,'USER_LOGIN_NAME')then
    begin
      try
        cdsMain.F_IsBatchOperating:=True;
        Screen.Cursor := crHourGlass;
        with cds0073_1 do
        begin
          First;
          while not Eof do
          begin
            if FieldByName('selected').AsBoolean then
            begin
              cdsMain.Append;
              cdsMain.FieldByName('operator_ptr').Value:= FieldByName('rkey').Value;
              cdsMain.FieldByName('departmentid').Value:= edt_departmentcode.F_rkey;
              cdsMain.FieldByName('program_ptr').Value:= edt_DESCRIPTION.F_rkey;
              cdsMain.FieldByName('USER_LOGIN_NAME').Value:= FieldByName('USER_LOGIN_NAME').Value;
              cdsMain.FieldByName('USER_FULL_NAME').Value:= FieldByName('USER_FULL_NAME').Value;
              cdsMain.FieldByName('departmentcode').Value:= edt_departmentcode.Text;
              cdsMain.FieldByName('departmentname').Value:= edt_departmentname.Text;
              cdsMain.FieldByName('DESCRIPTION').Value:= edt_DESCRIPTION.Text;
              cdsMain.FieldByName('PROGRAME').Value:= edt_PROGRAME.Text;
              cdsMain.Post;
            end;
            Next;
          end;
        end;
      finally
        cdsMain.F_IsBatchOperating:=False;
        Screen.Cursor := crDefault;
        dsMainStateChange(dsMain);
      end;
    end;
  end;
end;

procedure Tfrm_DepaRight.RadioGroup1Click(Sender: TObject);
begin
  inherited;
  if RadioGroup1.ItemIndex=0 then
  begin
    pnl_user.Visible:=True;
    pnl_user.Left:=RadioGroup1.Width;
    pnl_DEPT.Visible:=True;
    pnl_DEPT.Left:=pnl_user.Left+pnl_user.Width;
    pnl_DESCRIPTION.Visible:=False;
    edt_DESCRIPTION.Clear;
    edt_PROGRAME.Clear;
    pnl_but.Left:= pnl_DEPT.Left+pnl_DEPT.Width;
  end
  else
  if RadioGroup1.ItemIndex=1 then
  begin
    pnl_user.Visible:=True;
    pnl_user.Left:=RadioGroup1.Width;
    pnl_DEPT.Visible:=False;
    edt_departmentcode.Clear;
    edt_departmentname.Clear;
    pnl_DESCRIPTION.Visible:=True;
    pnl_DESCRIPTION.Left:=pnl_user.Left+pnl_user.Width;
    pnl_but.Left:= pnl_DESCRIPTION.Left+pnl_DESCRIPTION.Width;
  end
  else
  if RadioGroup1.ItemIndex=2 then
  begin
    pnl_user.Visible:=False;
    edt_USER_LOGIN_NAME.Clear;
    edt_USER_FULL_NAME.Clear;
    pnl_DEPT.Visible:=True;
    pnl_DEPT.Left:=RadioGroup1.Width;
    pnl_DESCRIPTION.Visible:=True;
    pnl_DESCRIPTION.Left:=pnl_DEPT.Left+pnl_DEPT.Width;
    pnl_but.Left:= pnl_DESCRIPTION.Left+pnl_DESCRIPTION.Width;
  end;
end;

procedure Tfrm_DepaRight.edt_DESCRIPTION_deleteChange(Sender: TObject);
begin
  inherited;
//  with cdsMain do
//  if RadioGroup1.ItemIndex=0 then   //  用户/部门
//  begin
//    if (Trim(edt_USER_LOGIN_NAME.Text)<>'')and(Trim(edt_departmentcode.Text)<>'') then
//    begin
//      Close;
//      CommandText:=F_SQLSelectFrom+#13+'where operator_ptr='+edt_USER_LOGIN_NAME.F_rkey
//      +' and departmentid = '+edt_departmentcode.F_rkey;
//      Open;
//      dsMainStateChange(dsMain);
//    end;
//  end
//  else
//  if RadioGroup1.ItemIndex=1 then  //用户/程序
//  begin
//
//    if (Trim(edt_USER_LOGIN_NAME.Text)<>'')and(Trim(edt_DESCRIPTION.Text)<>'') then
//    begin
//      Close;
//      CommandText:=F_SQLSelectFrom+#13+'where operator_ptr='+edt_USER_LOGIN_NAME.F_rkey
//      +' and program_ptr = '+edt_DESCRIPTION.F_rkey;
//      Open;
//      dsMainStateChange(dsMain);
//    end;
//  end
//  else
//  if RadioGroup1.ItemIndex=2 then       //部门/程序
//  begin
//
//    if (Trim(edt_departmentcode.Text)<>'')and(Trim(edt_DESCRIPTION.Text)<>'') then
//    begin
//      Close;
//      CommandText:=F_SQLSelectFrom+#13+'where departmentid='+edt_departmentcode.F_rkey
//      +' and program_ptr = '+edt_DESCRIPTION.F_rkey;
//      Open;
//      dsMainStateChange(dsMain);
//    end;
//  end;

end;

procedure Tfrm_DepaRight.FormShow(Sender: TObject);
begin
  inherited;
  cxTabSheet1.TabVisible:=False;
  RadioGroup1.OnClick(RadioGroup1);
end;

procedure Tfrm_DepaRight.Button2Click(Sender: TObject);
var
  frm_DepaRight1: Tfrm_DepaRight1;
begin
  inherited;
  try
    Application.CreateForm(Tfrm_DepaRight1, frm_DepaRight1);
    frm_DepaRight1.ShowModal;
  finally
    frm_DepaRight1.Free;
  end;
end;

procedure Tfrm_DepaRight.edt_USER_FULL_NAMEChange(Sender: TObject);
begin
  inherited;
  with cdsMain do
  if RadioGroup1.ItemIndex=0 then   //  用户/部门
  begin
    if (Trim(edt_USER_LOGIN_NAME.Text)<>'')and(Trim(edt_departmentcode.Text)<>'') then
    begin
      Close;
      CommandText:=F_SQLSelectFrom+#13+'where operator_ptr='+edt_USER_LOGIN_NAME.F_rkey
      +' and departmentid = '+edt_departmentcode.F_rkey;
      Open;
      dsMainStateChange(dsMain);
    end;
  end
  else
  if RadioGroup1.ItemIndex=1 then  //用户/程序
  begin

    if (Trim(edt_USER_LOGIN_NAME.Text)<>'')and(Trim(edt_DESCRIPTION.Text)<>'') then
    begin
      Close;
      CommandText:=F_SQLSelectFrom+#13+'where operator_ptr='+edt_USER_LOGIN_NAME.F_rkey
      +' and program_ptr = '+edt_DESCRIPTION.F_rkey;
      Open;
      dsMainStateChange(dsMain);
    end;
  end
  else
  if RadioGroup1.ItemIndex=2 then       //部门/程序
  begin

    if (Trim(edt_departmentcode.Text)<>'')and(Trim(edt_DESCRIPTION.Text)<>'') then
    begin
      Close;
      CommandText:=F_SQLSelectFrom+#13+'where departmentid='+edt_departmentcode.F_rkey
      +' and program_ptr = '+edt_DESCRIPTION.F_rkey;
      Open;
      dsMainStateChange(dsMain);
    end;
  end;
end;

end.
