unit form_DepaRight1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SingleDataSet, cxGraphics, cxControls, cxLookAndFeels,
  cxLookAndFeelPainters, dxSkinsCore, dxSkinsDefaultPainters,
  dxSkinsdxStatusBarPainter, dxSkinscxPCPainter, dxSkinsdxBarPainter,
  Menus, ppEndUsr, ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd,
  ppReport, ppComm, ppRelatv, ppDB, ppDBPipe, DB, DBClient, cds, Provider,
  ADODB, dxBar, cxClasses, ImgList, ActnList, Grids, DBGridEh, ToolWin,
  ComCtrls, cxPC, StdCtrls, RzPanel, ExtCtrls, dxStatusBar, EditBit, Mask,
  RzEdit, RzBtnEdt, ButtonEdit;

type
  Tfrm_DepaRight1 = class(TSingleDataSet_f)
    DBGridEh1: TDBGridEh;
    Label1: TLabel;
    edt_USER_FULL_NAME: TEdit;
    cds_datadepartment: TClientDataSet;
    cds_0419: TClientDataSet;
    cds_datadepartmentrkey: TIntegerField;
    cds_datadepartmentdepartmentname: TWideStringField;
    cds_datadepartmentdepartmentcode: TWideStringField;
    cds_0419rkey: TIntegerField;
    cds_0419DESCRIPTION: TStringField;
    cds_0419PROGRAME: TStringField;
    ds_adepartment: TDataSource;
    ds_0419: TDataSource;
    PopupMenu2: TPopupMenu;
    PopupMenu3: TPopupMenu;
    MenuItem1: TMenuItem;
    DBGridEh2: TDBGridEh;
    DBGridEh3: TDBGridEh;
    cdsMainUSER_LOGIN_NAME: TStringField;
    cdsMainUSER_FULL_NAME: TStringField;
    cdsMaindepartmentname: TWideStringField;
    cdsMaindepartmentcode: TWideStringField;
    cdsMainDESCRIPTION: TStringField;
    cdsMainPROGRAME: TStringField;
    cdsMainrkey: TAutoIncField;
    cdsMainoperator_ptr: TIntegerField;
    cdsMaindepartmentid: TIntegerField;
    cdsMainprogram_ptr: TIntegerField;
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
    Button3: TButton;
    edt_USER_LOGIN_NAME: TButtonEdit;
    procedure actAddExecute(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure DghMainEnter(Sender: TObject);
    procedure actSaveExecute(Sender: TObject);
    procedure actDeleteExecute(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure N1Click(Sender: TObject);
    procedure MenuItem1Click(Sender: TObject);
    procedure edt_USER_FULL_NAMEChange(Sender: TObject);
  private
    procedure SetToolbarButtonStatus(Flag:Boolean);override;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frm_DepaRight1: Tfrm_DepaRight1;

implementation

uses form_DepaRight, formSelectMultiItem, PublicFile, DM_f,
  form_DepaRight2;

{$R *.dfm}

procedure Tfrm_DepaRight1.SetToolbarButtonStatus(Flag: Boolean);
begin
  with cdsMain   do
  begin
    dxBarManager.LockUpdate:=True;

    tblAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    actAdd.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    tblSave.Enabled:=(StrToInt(vprev)in [2,4]);
    actSave.Enabled:=(StrToInt(vprev)in [2,4]);

    tblEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4]);
    actEdit.Enabled:=Flag and (StrToInt(vprev)in [2,4]);

    tblDelete.Enabled:=True and (StrToInt(vprev)in [2,4]);
    actDelete.Enabled:=True and (StrToInt(vprev)in [2,4]);

    if ((State  in [dsEdit,dsInsert])or(ChangeCount>0))  then
      begin
        tblSave.Enabled:=(StrToInt(vprev)in [2,4]);  //True and
        actSave.Enabled:=(StrToInt(vprev)in [2,4]); //True and
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
      end
    else
      begin
        tblCancel.Enabled:=False;
        actCancel.Enabled:=False;
        tblfind.Enabled:= True;
        actFind.Enabled:= True;
        tblRefresh .Enabled:=True;
        actRefresh .Enabled:=True;
        tblExport.Enabled:=True  and(StrToInt(vprev)in [2,4]);
        actExport.Enabled:=True  and(StrToInt(vprev)in [2,4]);
        tblExit.Enabled:=True;
        tblPrint.Enabled:= True   and (StrToInt(vprev)in [2,4]);      //打印
        tblDesign.Enabled:=True   and (StrToInt(vprev)in [2,4]) ;      //报表设计
        tblFilter.Enabled:= True;
        tblReject.Enabled:=True   and (StrToInt(vprev)in [2,4])  ;   //反提交
        tblExpand.Enabled:=True   and (StrToInt(vprev)in [2,4])  ;   //提交
        tblConfirm.Enabled:=True  and (StrToInt(vprev)in [2,4]);   //审核
        tblUConfirm.Enabled:=True and (StrToInt(vprev)in [2,4]);  //反审核
      end ;
  end;

  with cdsMain do
  begin
    if Eof  then
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

procedure Tfrm_DepaRight1.actAddExecute(Sender: TObject);
begin
  //inherited;
  if ActiveGridEh= DBGridEh3 then
  begin
    if ShowfrmSelectMultiItem(Self, cdsDataDepartment_1,'departmentcode')then
    begin
      try
        Screen.Cursor := crHourGlass;
        //cdsMain.F_IsBatchOperating:=True;
        with cdsDataDepartment_1 do             //  frm_DepaRight.
        begin

          First;
          while not Eof do
          begin
            if FieldByName('selected').AsBoolean then
            begin
              cds_datadepartment.Append;
              cds_datadepartment.FieldByName('rkey').Value:= fieldByName('rkey').value;
              cds_datadepartment.FieldByName('departmentname').Value:= fieldByName('departmentname').value;
              cds_datadepartment.FieldByName('departmentcode').Value:= FieldByName('departmentcode').Value;
              cds_datadepartment.Post;
            end;
            Next;
          end;
          CancelUpdates;  //将原勾选的记录全部取消
        end;
      finally
        Screen.Cursor := crDefault;
      end;
    end;
  end
  else
  if ActiveGridEh= DBGridEh2 then
  begin
    if ShowfrmSelectMultiItem(Self, cds419_1,'DESCRIPTION')then
    begin
      try
        Screen.Cursor := crHourGlass;
        with cds419_1 do
        begin
          First;
          while not Eof do
          begin
            if FieldByName('selected').AsBoolean then
            begin
              cds_0419.Append;
              cds_0419.FieldByName('rkey').Value:= FieldByName('rkey').Value;
              cds_0419.FieldByName('DESCRIPTION').Value:= FieldByName('DESCRIPTION').Value;
              cds_0419.FieldByName('PROGRAME').Value:= FieldByName('PROGRAME').Value;
              cds_0419.Post;
            end;
            Next;
          end;
          CancelUpdates;  //将原勾选的记录全部取消
        end;
      finally
        Screen.Cursor := crDefault;
        dsMainStateChange(dsMain);
      end;
    end;
  end;
end;

procedure Tfrm_DepaRight1.FormCreate(Sender: TObject);
begin
  //inherited;   这个窗体很特殊，不从父类中继承
  cdsMain.Open;
  cds_datadepartment.Open;
  cds_0419.Open;
  edt_USER_LOGIN_NAME.F_ColsInfo := 'USER_LOGIN_NAME/登陆名/100,USER_FULL_NAME/用户名/140';
end;

procedure Tfrm_DepaRight1.DghMainEnter(Sender: TObject);
begin
  inherited;
  ActiveGridEH:=   Sender as TDBGridEh;
end;

procedure Tfrm_DepaRight1.actSaveExecute(Sender: TObject);
var
  strSQL:string;
begin
  //inherited;
  if edt_USER_LOGIN_NAME.Text='' then
  begin
    msgerror('用户代码不能为空！！！');
    Exit;
  end;
  if cds_datadepartment.IsEmpty     then
  begin
    msgerror('部门不能为空！！！');
    Exit;
  end;
  if cds_0419.IsEmpty     then
  begin
    msgerror('程序不能为空！！！');
    Exit;
  end;

  cds_datadepartment.DisableControls;
  cds_0419.DisableControls;
  cds_datadepartment.first;
  Screen.Cursor := crHourGlass;
  try
    try
      DM.ADOConnection1.BeginTrans;
      with cdsMain do
      begin
        while not cds_datadepartment.Eof do
        begin
          cds_0419          .first;
          while  not cds_0419.Eof  do
          begin
            strSQL:='Declare @operator_ptr int ,@departmentid int,@program_ptr int  '
            +' set @operator_ptr= '+edt_USER_LOGIN_NAME.F_rkey
            +' set @departmentid= '+cds_datadepartment.FieldByName('rkey').AsString
            +' set @program_ptr=  '+cds_0419.FieldByName('rkey').AsString
            +' if not exists(select * from hr_permission where operator_ptr=@operator_ptr and departmentid=@departmentid and program_ptr=@program_ptr) '
            +' insert into dbo.hr_permission values(@operator_ptr,@departmentid,@program_ptr)';
            cdsMain.CommandText:=strSQL;
            cdsMain.Execute;
            cds_0419.Next;
          end;
          cds_datadepartment.Next;
        end
      end;
      DM.ADOConnection1.CommitTrans;
      MsgInfo('数据保存成功');
    except
      DM.ADOConnection1.RollbackTrans;
      MsgError('数据提交出现错误,请与管理员联系!!!');
    end;
  finally
    Screen.Cursor := crDefault;
    cds_datadepartment.EnableControls;
    cds_0419.EnableControls;
  end;

end;

procedure Tfrm_DepaRight1.actDeleteExecute(Sender: TObject);
begin
  //inherited;
  with ActiveGridEH.DataSource.DataSet do
  begin
    if IsEmpty =False then
    Delete;
  end;
end;

procedure Tfrm_DepaRight1.Button3Click(Sender: TObject);
var
  frm_DepaRight2: Tfrm_DepaRight2;
begin
  inherited;
  try
    frm_DepaRight2 := Tfrm_DepaRight2.Create(Application);
    frm_DepaRight2.cdsMain.Close;
    frm_DepaRight2.cdsMain.Params.ParamByName('voperator_ptr').Value:=edt_USER_LOGIN_NAME.F_rkey;
    frm_DepaRight2.cdsMain.Open;
    frm_DepaRight2.ShowModal;
  finally
    frm_DepaRight2.Free;
  end;

end;

procedure Tfrm_DepaRight1.FormShow(Sender: TObject);
begin
//  inherited;
  ActiveGridEH:=DBGridEh3;
end;

procedure Tfrm_DepaRight1.N1Click(Sender: TObject);
begin
  inherited;
  actAddExecute(nil);
end;

procedure Tfrm_DepaRight1.MenuItem1Click(Sender: TObject);
begin
  inherited;
  actAddExecute(nil);
end;

procedure Tfrm_DepaRight1.edt_USER_FULL_NAMEChange(Sender: TObject);
begin
  inherited;
  if (edt_USER_LOGIN_NAME.F_rkey <> '')and(StrToInt(edt_USER_LOGIN_NAME.F_rkey) > 0) then
    Button3.Enabled :=  True
  else
    Button3.Enabled := False;
end;

end.
