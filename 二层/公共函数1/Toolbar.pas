unit Toolbar;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, base, dxSkinsCore, dxSkinsDefaultPainters, dxSkinsdxBarPainter,
  dxBar, cxClasses, ImgList, ActnList, cxGraphics, cxControls,
  cxLookAndFeels, cxLookAndFeelPainters, dxSkinsdxStatusBarPainter,
  dxStatusBar, DB, DBClient, cds, Provider, ADODB, StdCtrls, ppEndUsr,
  ppBands, ppPrnabl, ppClass, ppCtrls, ppCache, ppProd, ppReport, ppComm,
  ppRelatv, ppDB, ppDBPipe, Grids, DBGridEh,  Mask, DBCtrls, RzEdit,
  RzDBEdit, RzDBBnEd,LogWriteform, DBButtonEdit, PublicFile,Contnrs;

type
  TToolbar_f = class(TBase_f)
    ActionList: TActionList;
    actClose: TAction;
    actAdd: TAction;
    actEdit: TAction;
    actSave: TAction;
    actCancel: TAction;
    actDelete: TAction;
    actFind: TAction;
    actRefresh: TAction;
    actFirst: TAction;
    actPrior: TAction;
    actNext: TAction;
    actLast: TAction;
    actHelp: TAction;
    actPrint: TAction;
    actExport: TAction;
    actDesign: TAction;
    actReject: TAction;
    actExpand: TAction;
    actFilter: TAction;
    actCancelFilter: TAction;
    actUpload: TAction;
    actDownload: TAction;
    actConfirm: TAction;
    actUConfirm: TAction;
    Images: TImageList;
    dxBarManager: TdxBarManager;
    dxBarManagerBar2: TdxBar;
    mnuFile: TdxBarSubItem;
    mnuOperate: TdxBarSubItem;
    mnuHelp: TdxBarSubItem;
    tblAdd: TdxBarLargeButton;
    tblEdit: TdxBarLargeButton;
    tblSave: TdxBarLargeButton;
    tblCancel: TdxBarLargeButton;
    tblDelete: TdxBarLargeButton;
    tblFind: TdxBarLargeButton;
    tblFirst: TdxBarLargeButton;
    tblLast: TdxBarLargeButton;
    tblPrior: TdxBarLargeButton;
    tblNext: TdxBarLargeButton;
    tblHelp: TdxBarLargeButton;
    tblRefresh: TdxBarLargeButton;
    tblExit: TdxBarLargeButton;
    tblPrint: TdxBarLargeButton;
    tblExport: TdxBarLargeButton;
    tblUConfirm: TdxBarLargeButton;
    tblConfirm: TdxBarLargeButton;
    tblReject: TdxBarLargeButton;
    tblDesign: TdxBarLargeButton;
    tblCancelFilter: TdxBarLargeButton;
    tblFilter: TdxBarLargeButton;
    tblExpand: TdxBarLargeButton;
    tblUpload: TdxBarLargeButton;
    tblDownload: TdxBarLargeButton;
    dxStatusBar1: TdxStatusBar;
    dtMain: TADODataSet;
    dspMain: TDataSetProvider;
    cdsMain: Tcds;
    dsMain: TDataSource;
    dtRead: TADODataSet;
    dspRead: TDataSetProvider;
    cdsRead: TClientDataSet;
    pp_DBPipeline1: TppDBPipeline;
    pp_Report1: TppReport;
    ppHeaderBand1: TppHeaderBand;
    ppDetailBand1: TppDetailBand;
    ppDBText1: TppDBText;
    ppDBText2: TppDBText;
    ppFooterBand1: TppFooterBand;
    pp_Designer1: TppDesigner;
    DtForeignKeyFieldQty: TClientDataSet;
    procedure actCloseExecute(Sender: TObject);
    procedure actPrintExecute(Sender: TObject);
    procedure actDesignExecute(Sender: TObject);
    procedure actFindExecute(Sender: TObject);
    procedure dspMainAfterUpdateRecord(Sender: TObject; SourceDS: TDataSet;
      DeltaDS: TCustomClientDataSet; UpdateKind: TUpdateKind);
    procedure dsMainStateChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
     { Private declarations }
  protected
    NeedSave:Boolean;//需要保存，有些程序可能不需要保存，所以数据出现更改，关闭时也不会提示是否需要保存。
    frmFindOutSQL:string;
    FindNotDisplayFields  :array of string;
    FindDisplayFields     :array of string;
    FindFieldsName        :array of string;
    FindQueryFieldsName   :array of string;
    Find_Def_FieldName    :array of String;
    Find_Def_Oper         :array of String;
    Find_Def_FieldValue   :array of String;
    Find_Def_Field2Value  :array of String;
        {以上5个变量用于查询窗口，其中FindDisplayFields为空的时候，FindNotDisplayFields才有效，
        默认取全部的字段做为查询条件。某些联合查询比较复杂，字段名在多个表中存在，
        所以可用FindFieldsName和FindQueryFieldsName进行字段名的更改,所以不是必须赋值。
        如将'number'改为'dbo.DATA0268.number'}
    ReportFileName:AnsiString;
    FirstControl,LastControl :TWinControl;
    AutoNumb_Edit            :TDBEdit;
    var_DropDown_Info : TDropDownInfo; //用来记录改变字段、下拉列表、查找窗口相关信息
    DropDown_Info_List:  TObjectList ;  //DropDown_Info的容器变量
    Data_Info: array of TDataInfo;     //该信息用来记录日志
    function SaveBeforeCheck():Boolean;    virtual;abstract;
    function SaveData():Boolean;           virtual;abstract;
    function DeleteBeforeCheck():Boolean;  virtual;
    function EditForeignKeyCheck():Boolean;virtual;
    function DeleteSaveData():Boolean;     virtual;abstract;
    procedure FindData();                  virtual;
    procedure RightsSetDataSetReadOnly;    virtual;abstract;
    procedure SetToolbarButtonStatus(Flag: Boolean);virtual;abstract;    //功能设置工具栏按钮的状态。申明的是虚方法，如果子类需修改，可覆盖override                                                                         {用于下列事件事件中:DtMainAfterScroll;DsMainStateChange}
    procedure SetButtonStatus;             virtual;//abstract;   //设置窗口右边竖按钮的状态。
                                                  {用于下列事件事件中:DghMainMouseUp;DsMainStateChange
                                                    abstract 表示是抽象方法；是没有实现的方法，并且必须是virtual或dynamic方法，即
                                                    在abstract前面必须有virtual或dynamic关键字，其实现部分在派生类中    }
    procedure SetMultiSelectButtonStatus;virtual;
    procedure DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);
    procedure ComponentReadOnly_T();
    procedure ComponentReadOnly_F(NotEditComponents:array of string);
    procedure Relogin  ;//重新登陆
    procedure DropDownInfo_Init(var ADropDownInfo:TDropDownInfo);
    
  public

//    procedure SetGridColumns;

    { Public declarations }
  end;

var
  Toolbar_f: TToolbar_f;


implementation

uses Findcds_unt,  DM_f,      SelectItem_unt,
  formGetUserRights, ColsDisplaySet_unt;

{$R *.dfm}

procedure TToolbar_f.DropDownInfo_Init(var ADropDownInfo:TDropDownInfo); //给字段设置改变事件和给表格设置下拉列
begin
  with  ADropDownInfo do
  begin
    if (L_ListDataSet<>nil)and(NeedSave) then
    begin
      if L_GridName<>nil then
      with (L_GridName) do
      begin
        FieldColumns[L_DropdownColumn].ButtonStyle:=cbsDropDown;
        FieldColumns[L_DropdownColumn].AlwaysShowEditButton:=true;
        if (L_ListDataSet<>nil) then
        FieldColumns[L_DropdownColumn].OnEditButtonClick:= DBGridEHColumnsButtonClick;
      end;
    end;
  end;
end;

function TToolbar_f.EditForeignKeyCheck():Boolean;

var
  i:Integer;
  IsEdit: Boolean;
  SQL,Msg,ConstID:string;
begin                     {该过程允许在同一数据窗口不同的数据集上调用多次（比如主从表结构的数据窗口），
                           同一张被检查的表会创建名为 TableName+'DtForeignKeyFieldQty'的数据集，
                           允许被多次使用，不用反复打开表，从而提高效率。 }
  Result:=True;
  if cdsMain.F_TableName<>'' then
  begin
    if DtForeignKeyFieldQty.Active=False then
    begin
      DtForeignKeyFieldQty.CommandText:=
      'select co.ConstID ,o.name as FTableName, c.name as FFieldName,o1.name as RTableName,c1.name as RFieldName, '
      +'Cast(isnull(g.[value],'''') as varchar(50))+Cast(o.name as varchar(50)) as TableDescription '
      +'from sysforeignkeys f join sysconstraints co on f.constid=co.constid  '
      +'join dbo.syscolumns c on f.fkeyid=c.id and f.fkey=c.colid  '
      +'join dbo.sysObjects  o on  c.id =o.id and o.id =co.id  '
      +'join dbo.syscolumns c1 on f.rkeyid=c1.id and f.rkey=c1.colid '
      +'join dbo.sysObjects  o1 on  c1.id =o1.id '
      +'left join sys.extended_properties g  on (o.id = g.major_id AND g.minor_id = 0) '
      +'where o1.name=  '+QuotedStr( cdsMain.F_TableName)
      +' order by f.constid, rkey';
     // ShowMessage(DtForeignKeyFieldQty.CommandText);
      DtForeignKeyFieldQty.Open;
    end ;
    SQL:=''; //初始化值。
    Msg:='';
    ConstID:='';
    IsEdit:=False;

    with   DtForeignKeyFieldQty do
    begin
      if  IsEmpty then Exit;//如果记录为零，退出
      First;

        ConstID:= FieldByName('ConstID').AsString ;
        SQL:=SQL+AddSql(SQL)+ FieldByName('FFieldName').Value+' = '
             +QuotedStr(Trim(cdsMain.FieldByName(FieldByName('RFieldName').Value).OldValue)); //被修改的数据
        ShowMessage(sql);
        ShowMessage(cdsMain.FieldByName(FieldByName('RFieldName').Value).OldValue
        +':'+cdsMain.FieldByName(FieldByName('RFieldName').Value).NewValue);

        if Trim(cdsMain.FieldByName(FieldByName('RFieldName').Value).OldValue)<>
          Trim(cdsMain.FieldByName(FieldByName('RFieldName').Value).NewValue)  then
          IsEdit:=True;

        Msg:=Msg+ '字段：“'+cdsMain.FieldByName(FieldByName('RFieldName').asString).DisplayLabel+'”的值'
             + '“'+ (string(cdsMain.FieldByName(FieldByName('RFieldName').asString).OldValue)) +'”，'+#10#13 ;
        Next;

      for I:=0 to RecordCount-1 do// while not (Eof )do//该循环要多执行一次，所以不能用RecordCount-1
      begin

        if ConstID<>'' then
        if (ConstID<> FieldByName('ConstID').AsString )or(Eof) then
        begin
          if  IsEdit then
          begin
            showmessage(sql);
            if  RecordExists('select * from '+cdsMain.F_TableName+#10#13+SQL,cdsRead) then   //是自定义FUNCTION，如果记录存在，返回真，否则返回假
            begin
              msgerror(Msg+'已经被“'
  //该行不能删除// +SQLResultValue('select FormCaptionCN from ussysTableName where tableName=' +QuotedStr(FTableName))
                +cdsMain.F_TableName+'”子表引用，现不允许修改！');   //在DATA表上，不存在字段名为“”的记录。
              Abort;        //结束当前用户的操作。
            end;
          end;
          SQL:=''; //初始化值。
          Msg:='';
          IsEdit:=false;
        end;

        if not Eof then
        begin
        ConstID:= FieldByName('ConstID').AsString ;
        cdsMain.F_TableName:=  FieldByName('FTableName').AsString ;

        SQL:=SQL+AddSql(SQL)+ FieldByName('FFieldName').Value+' = '
             +QuotedStr(Trim(cdsMain.FieldByName(FieldByName('RFieldName').Value).OldValue)); //被修改的数据
        if Trim(cdsMain.FieldByName(FieldByName('RFieldName').Value).OldValue)<>
          Trim(cdsMain.FieldByName(FieldByName('RFieldName').Value).NewValue)  then
          IsEdit:=True;

        Msg:=Msg+ '字段：“'+cdsMain.FieldByName(FieldByName('RFieldName').asString).DisplayLabel+'”的值'
             + '“'+ Trim(string(cdsMain.FieldByName(FieldByName('RFieldName').asString).OldValue)) +'”，'+#10#13 ;
        Next;
        end;
      end ;
    end;
  end;
end;
{
procedure TToolbar_f.SetGridColumns;
var
  GridCount,i,ColID,ExecRkey:Integer;
  StrFilter:string;
begin
  with DM.cdsRead do
  begin
    Close;
    CommandText:='select * from data0419 where programe='+QuotedStr(Extractfilename(application.exename));
    Open;
    ExecRkey:=FieldByName('rkey').Value;
  end ;
  for GridCount:=0 to Self.ComponentCount-1 do
  if  Self.Components[GridCount] is TDBGridEh then
  with (Self.Components[GridCount] as TDBGridEh) do
  begin
    if DM.cds0849.Active=False then
    begin
      DM.cds0849.Params.ParamByName('vPrograme').Value:=Extractfilename(application.exename);
      DM.cds0849.Params.ParamByName('vD073_ptr').Value:=UserRKEY;
      DM.cds0849.Open;
    end;
    DM.cds0849.Filtered:=False ;                         //用窗口名和表格名对数据进行过滤
    StrFilter:='FormName='+QuotedStr(Self.Name)
              +' and GridName=' +QuotedStr((Self.Components[GridCount] as TDBGridEh).Name);
    DM.cds0849.Filter:= StrFilter;
    DM.cds0849.Filtered:=True;

    DM.cds0849.First;
    while not DM.cds0849.Eof do     // 遍历cds0849 ，查找是否有表格中不存的列，不存在删除。
    begin
      for i:=0 to Columns.Count-1  do
      begin
        if UpperCase(Trim(Columns[i].FieldName))=UpperCase(Trim(DM.cds0849.FieldByName('FieldName').AsString))then
          begin
            Break  ;
          end
        else                                         //如果没有找到
          begin
            if i=Columns.Count-1 then   //已经是最后一列
            begin
              DM.cds0849.Delete   ;
            end;
          end;
      end;
      DM.cds0849.Next;
    end;

    for i:=0 to Columns.Count-1  do            //如果表格中的列在 DM.cds0849中不存在，添加
    if Columns[i].FieldName<>''then
    begin
      DM.cds0849.Filtered:=False;               //然后和data0849表中记录的列名进行过滤
      DM.cds0849.Filter:=StrFilter+' and FieldName='+ QuotedStr(Columns[i].FieldName);
      DM.cds0849.Filtered:=True;
      if  DM.cds0849.IsEmpty then               //如果在data0849表记录中不存在，添加
      begin
        DM.cds0849.Append;
        DM.cds0849.FieldByName('D419_ptr')    .Value:=ExecRkey;
        DM.cds0849.FieldByName('D073_ptr')    .Value:=UserRKEY;
        DM.cds0849.FieldByName('FormName')    .Value:=Self.Name;
        DM.cds0849.FieldByName('GridName')    .Value:=Name;
        DM.cds0849.FieldByName('FieldName')   .Value:=Columns[i].Field.FieldName;
        DM.cds0849.FieldByName('FieldCaption').Value:=Columns[i].Field.DisplayLabel;
        DM.cds0849.FieldByName('FieldOrder')  .Value:=i;
        DM.cds0849.FieldByName('FieldWidth')  .Value:=Columns[i].Width;
        if Columns[i].Visible then
          DM.cds0849.FieldByName('IsDisplay').Value:=True
        else
          DM.cds0849.FieldByName('IsDisplay').Value:=False;
        DM.cds0849.Post;
      end;
    end;

    ColID:=0;
    DM.cds0849.Filtered:=False ;
    DM.cds0849.Filter:= StrFilter;
    DM.cds0849.Filtered:=True;
    while not DM.cds0849.Eof do   //根据 cds0849表中的记录，重新定义表格
    begin
      for i:=0 to Columns.Count-1 do
      if UpperCase(Columns[i].FieldName)=UpperCase(DM.cds0849.FieldByName('FieldName').AsString)then
      begin
        begin
          Columns[i].Width:= DM.cds0849.FieldByName('FieldWidth').AsInteger;
          if DM.cds0849.FieldByName('IsDisplay').AsBoolean then
            Columns[i].Visible:=True
          else
            Columns[i].Visible:=False;
          Columns[i].Index:=ColID;
          ColID:=ColID+1;
        end;
        Break;
      end;
      DM.cds0849.Next;
    end;
  end;
  DM.cds0849.Filtered:=False;
end;   }

procedure TToolbar_f.Relogin  ;
var
  vUsernameRkey,vEmployeeRkey,vUser_rights:string;
begin
  if GetUserRights(Self,DM.ADOConnection1,vUsernameRkey, vEmployeeRkey,vUser_rights,'重置登陆用户名') then
  begin
    vprev:= vUser_rights;
    UserRKEY:= StrToInt(vUsernameRkey);
    SetEmployeeInfo(dtRead,dxStatusBar1);
    RightsSetDataSetReadOnly;

    cdsMain.Refresh;
    MsgInfo('你已重置当前程序的登陆用户名，操作完成后务必关闭！！！');
  end;
end;

{procedure TToolbar_f.SetEmployeeInfo;
begin
  DM.cdsRead.Close;
  DM.cdsRead.CommandText:='select d3.USER_FULL_NAME,d3.USER_LOGIN_NAME,d3.EMPLOYEE_PTR,d5.EMPLOYEE_NAME,d5.EMPL_CODE '
        +' from data0073 d3 left join data0005 d5 on d3.EMPLOYEE_PTR=d5.rkey where d3.rkey='+IntToStr(UserRKEY);

  DM.cdsRead.Open;
  if DM.cdsRead.IsEmpty=False then
  begin
    UserName := DM.cdsRead.FieldByName('USER_FULL_NAME').Value ;
    USER_FULL_NAME := DM.cdsRead.FieldByName('USER_FULL_NAME').Value ;
    USER_LOGIN_NAME:= DM.cdsRead.FieldByName('USER_LOGIN_NAME').Value ;
    EmplRKEY := DM.cdsRead.FieldByName('EMPLOYEE_PTR').AsInteger ;
    EMPL_CODE:= DM.cdsRead.FieldByName('EMPL_CODE').Value ;
    EmplName := DM.cdsRead.FieldByName('EMPLOYEE_NAME').Value ;
    dxStatusBar1.Panels[1].Text:='用户名：'+trim(USER_FULL_NAME)+' ('+trim(USER_LOGIN_NAME)+')';
    dxStatusBar1.Panels[1].PanelStyle.Font.Color:= clBlue;
  end;
end; }
procedure TToolbar_f.SetMultiSelectButtonStatus;
begin

end;

procedure TToolbar_f.ComponentReadOnly_T();  //调用：ET(self);或：ET（MYFORMNAME）
var
  i:integer;
begin   //设窗口上的所有Edit和Combobox类控件可用。
  for i:=self.ComponentCount-1 downto 0  do
  begin
    if (self.Components[i] is TDBEdit) then
      begin
        TDBEdit(self.Components[i]).ReadOnly:=true ;
        TDBEdit(self.Components[i]).Color:=clInactiveCaptionText ;
      end
    else
    if (self.Components[i] is TDBComboBox) then
      begin
        TDBComboBox(self.Components[i]).ReadOnly:=True ;
        TDBEdit(self.Components[i]).Color:=clInactiveCaptionText ;
      end
    else
    if (self.Components[i] is TDBRadioGroup) then
      begin
        TDBRadioGroup(self.Components[i]).ReadOnly:=True;
        TDBEdit(self.Components[i]).Color:=clInactiveCaptionText ;
      end
    else
    if (self.Components[i] is TDBButtonEdit) then
      begin
        TDBButtonEdit(self.Components[i]).ReadOnly:=True;
        TDBButtonEdit(self.Components[i]).Color:=clInactiveCaptionText ;
      end
    else
    if (self.Components[i] is TDBMemo) then
      begin
        TDBMemo(self.Components[i]).ReadOnly:=true ;
        TDBMemo(self.Components[i]).Color:=clInactiveCaptionText ;
      end
    else
    if (self.Components[i] is TDBCheckBox) then
      begin
        TDBCheckBox(self.Components[i]).ReadOnly:=True;
      end      ;
  end;
end;

procedure TToolbar_f.ComponentReadOnly_F(NotEditComponents:array of string);  //调用：ET(self);或：ET（MYFORMNAME）
var
  i,j:integer;
  vNotEdit:Boolean;
begin        //设窗口上的所有Edit和Combobox类控件可用，NotEditComponents中除外。

  for i:=self.ComponentCount-1 downto 0  do
  begin
    vNotEdit:=False;
    for j:=0 to High (NotEditComponents) do
    if  UpperCase(NotEditComponents[j])=UpperCase(self.Components[i].Name ) then
    begin
      vNotEdit:=True;
      Break   ;
      //Continue;//: 结束循环内的本次处理,继续从循环体的开始位置继续执行;
    end;

    begin
      if (self.Components[i] is TDBEdit) then
        begin
          TDBEdit(self.Components[i]).ReadOnly:=vNotEdit ;
          if  vNotEdit=False then
          TDBEdit(self.Components[i]).Color:=clWindow ;
        end
      else
      if (self.Components[i] is TDBComboBox) then
        begin
          TDBComboBox(self.Components[i]).ReadOnly:=vNotEdit   ;
          if  vNotEdit=False then
          TDBComboBox(self.Components[i]).Color:=clWindow ;
        end
      else
      if (self.Components[i] is TDBRadioGroup) then
        begin
          TDBRadioGroup(self.Components[i]).ReadOnly:=vNotEdit;
          if  vNotEdit=False then
          TDBRadioGroup(self.Components[i]).Color:=clWindow ;
        end
      else
      if (self.Components[i] is TDBButtonEdit) then
        begin
          TDBButtonEdit(self.Components[i]).ReadOnly:=vNotEdit;
          if  vNotEdit=False then
          TDBButtonEdit(self.Components[i]).Color:=clWindow ;
        end
      else
      if (self.Components[i] is TDBMemo) then
        begin
          TDBMemo(self.Components[i]).ReadOnly:=vNotEdit ;
          if  vNotEdit=False then
          TDBMemo(self.Components[i]).Color:=clWindow ;
        end
      else
      if (self.Components[i] is TDBCheckBox) then
        begin
          TDBCheckBox(self.Components[i]).ReadOnly:=vNotEdit;
        end ;
    end;
  end;
end;

function TToolbar_f.DeleteBeforeCheck():Boolean;
var
  i :Integer;
  SQL,Msg,ConstID,FTableName:string;
begin
  Result:=True;
  if cdsMain.F_TableName<>'' then
  begin
       {该过程允许在同一数据窗口不同的数据集上调用多次（比如主从表结构的数据窗口），
        允许被多次使用，不用反复打开表，从而提高效率。检查是否已有外键引用 }
    if DtForeignKeyFieldQty.Active=False then
    begin
      DtForeignKeyFieldQty.CommandText:=
      'select co.ConstID ,o.name as FTableName, c.name as FFieldName,o1.name as RTableName,c1.name as RFieldName, '
      +'Cast(isnull(g.[value],'''') as varchar(50))+Cast(o.name as varchar(50)) as TableDescription '
      +'from sysforeignkeys f join sysconstraints co on f.constid=co.constid  '
      +'join dbo.syscolumns c on f.fkeyid=c.id and f.fkey=c.colid  '
      +'join dbo.sysObjects  o on  c.id =o.id and o.id =co.id  '
      +'join dbo.syscolumns c1 on f.rkeyid=c1.id and f.rkey=c1.colid '
      +'join dbo.sysObjects  o1 on  c1.id =o1.id '
      +'left join sys.extended_properties g  on (o.id = g.major_id AND g.minor_id = 0) '
      +'where o1.name=  '+QuotedStr( cdsMain.F_TableName)
      +' order by f.constid, rkey';
      DtForeignKeyFieldQty.Open;
    end ;

    SQL:=''; //初始化值。
    Msg:='';
    ConstID:='';
    FTableName:='' ;
    with   DtForeignKeyFieldQty do
    begin
      if  IsEmpty then Exit;//如果记录为零，退出
      First;
      ConstID:= FieldByName('ConstID').AsString ;
      FTableName:=FieldByName('FTableName').AsString;
      SQL:=SQL+AddSql(SQL)+ FieldByName('FFieldName').Value+' = '
           +QuotedStr(cdsMain.FieldByName(FieldByName('RFieldName').asstring).Value); //被修改的数据

      if  cdsMain.F_UniqueKey='' then
        Msg:=Msg+ '字段：“'+cdsMain.FieldByName(FieldByName('RFieldName').asString).DisplayLabel+'”的值'
             + '“'+ cdsMain.FieldByName(FieldByName('RFieldName').asString).asString +'”，'+#10#13
      else
        Msg:=Msg+ '字段：“'+cdsMain.FieldByName(cdsMain.F_UniqueKey).DisplayLabel+'”的值'
             + '“'+ cdsMain.FieldByName(cdsMain.F_UniqueKey).asString +'”，'+#10#13  ;
      Next;
      for I:=0 to RecordCount-1 do
      begin
        if ConstID<>'' then
        if (ConstID<> FieldByName('ConstID').AsString )or(Eof) then
        begin
          if  RecordExists('select * from '+FTableName+#10#13+SQL,cdsRead) then   //  PrimKeyExists()是自定义FUNCTION，如果记录存在，返回真，否则返回假
          begin
            msgerror(Msg+'已经被“'+FieldByName('TableDescription').AsString +'”表引用，现不允许删除！');   //
            Result:=False;        //结束当前用户的操作。
          end;
          SQL:=''; //初始化值。
          Msg:='';
        end;
        ConstID:= FieldByName('ConstID').AsString ;
        FTableName:=FieldByName('FTableName').AsString;
        SQL:=SQL+AddSql(SQL)+ FieldByName('FFieldName').Value+' = '
             +QuotedStr(cdsMain.FieldByName(FieldByName('RFieldName').Value).Value); //被修改的数据
        if  cdsMain.F_UniqueKey='' then
          Msg:=Msg+ '字段：“'+cdsMain.FieldByName(FieldByName('RFieldName').asString).DisplayLabel+'”的值'
               + '“'+ cdsMain.FieldByName(FieldByName('RFieldName').asString).asString +'”，'+#10#13
        else
          Msg:=Msg+ '字段：“'+cdsMain.FieldByName(cdsMain.F_UniqueKey).DisplayLabel+'”的值'
               + '“'+ cdsMain.FieldByName(cdsMain.F_UniqueKey).asString +'”，'+#10#13  ;
        Next;
      end ;
    end;
  end;
end;

procedure TToolbar_f.SetButtonStatus;
begin

end;

procedure TToolbar_f.FindData();
begin
  try
    Screen.Cursor := crHourGlass;
    if ShowfrmFindcds(cdsMain,frmFindOutSQL,DropDown_Info_List,FindNotDisplayFields,FindDisplayFields,FindFieldsName,
    FindQueryFieldsName,Find_Def_FieldName,Find_Def_Oper,Find_Def_FieldValue,Find_Def_Field2Value) then  //,FindFormHeight
    begin
      try
        cdsMain.F_IsBatchOperating:=True;
        cdsMain.Close;
        if  cdsMain.F_SQLWhere='' then
          cdsMain.CommandText:= cdsMain.F_SQLSelectFrom+#13+'where '+frmFindOutSQL
        else
          cdsMain.CommandText:= cdsMain.F_SQLSelectFrom+#13+cdsMain.F_SQLWhere+#13+'and '+frmFindOutSQL ;

        if  cdsMain.F_SQLOrderBy<>'' then
        cdsMain.CommandText:=cdsMain.CommandText+#13+cdsMain.F_SQLOrderBy;

        cdsMain.Open;
      finally
        cdsMain.F_IsBatchOperating:=False;
      end;
    end;
  finally
    Screen.Cursor := crDefault;
  end;
end;

procedure TToolbar_f.FormCreate(Sender: TObject);
begin
  inherited;
  DropDown_Info_List:=         TObjectList.Create();
  NeedSave:=True;
end;

procedure TToolbar_f.DBGridEHColumnsButtonClick(Sender: TObject;var Handled: Boolean);  //
var
  i:Integer;
begin
  with ((Sender as TControl).Parent).Parent as TDBGridEh do
  begin
    if  DataSource.DataSet is TClientDataSet then
    if ((((Sender as TControl).Parent).Parent as TDBGridEh).DataSource.DataSet as TClientDataSet).ReadOnly then
    Exit;
    if  DataSource.DataSet is TCustomADODataSet then
    if (DataSource.DataSet as TCustomADODataSet).LockType=ltReadOnly then
    Exit;
    if ReadOnly then        //如果当前表格控件是只读，退出。
    Exit;
  end;

  try
    Screen.Cursor := crHourGlass;
    with ((Sender as TControl).Parent).Parent as TDBGridEh do  //Button的父是EDIT，EDIT的父才是DBGRIDEH控件
    begin
      for i:=0 to DropDown_Info_List.Count-1 do
      begin
        with DropDown_Info_List.Items[i] as TDropDownInfo do
        begin
          if L_GridName<>nil then
          if Name= L_GridName.Name then  //当前正在下拉表格的名子= 遍历DropDown_Info中的表格名
          if UpperCase(L_DropdownColumn)=UpperCase(SelectedField.FieldName)  then
          begin
            if L_ListDataSet.Active=False then
              L_ListDataSet.Open;
            if L_FormType<=1 then
            begin
              if Show_Item_frm(L_ListDataSet,L_ListDataSetFilterField,
                        Trim(L_GridName.FieldColumns[L_DropdownColumn].Field.asstring),L_ColsInfo,
                        (Sender as TControl)) then   //
              begin
                if not (L_GridName.DataSource.DataSet.State in [dsEdit,dsInsert]) then
                  L_GridName.DataSource.DataSet.Edit;
                L_GridName.DataSource.DataSet.FieldByName(L_GetValueField).Value :=
                              L_ListDataSet.FieldByName(L_ListResultField).value;
              end  ;
              if L_ListDataSet.Filtered then
              L_ListDataSet.Filtered :=False;

              Break;
            end;
          end;
        end;
      end;
    end;
  finally    
    Screen.Cursor := crDefault;
  end;
end;

procedure TToolbar_f.actCloseExecute(Sender: TObject);
begin
  inherited;
  Close;
end;

procedure TToolbar_f.actPrintExecute(Sender: TObject);
begin
  inherited;
  pp_Report1.Template.FileName :=
          stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ReportFileName;
  pp_Report1.Template.LoadFromFile;
  pp_Report1.SaveAsTemplate := false;
  pp_Report1.Print;
end;

procedure TToolbar_f.actDesignExecute(Sender: TObject);
begin
  inherited;
  pp_Report1.Template.FileName :=
           stringReplace(GetCurrentDir,'EXEC','NIERP\REPORT\',[rfReplaceAll])+ReportFileName;
  pp_Report1.Template.LoadFromFile;
  pp_Report1.SaveAsTemplate := True;
  pp_Designer1.ShowModal;
end;

procedure TToolbar_f.actFindExecute(Sender: TObject);
begin
  inherited;
  FindData;
end;

procedure TToolbar_f.dspMainAfterUpdateRecord(Sender: TObject;
  SourceDS: TDataSet; DeltaDS: TCustomClientDataSet;
  UpdateKind: TUpdateKind);
begin
  inherited;
  if cdsMain.F_AutoIncrField<>'' then
  if UpdateKind= ukInsert then      //这段代码的作用是客户端获取自动编号的值。
  begin
    with dtRead  do
    begin
     Close;
     CommandText:='select @@identity';
     Open;
     DeltaDS.FieldByName(cdsMain.F_AutoIncrField).ReadOnly:=False;
     DeltaDS.FieldByName(cdsMain.F_AutoIncrField).NewValue:=dtRead.Fields[0].Value;
     Close;
    end;
  end;
end;

procedure TToolbar_f.dsMainStateChange(Sender: TObject);
begin
  inherited;
  if cdsMain.Active then
  if (cdsMain.F_UKSaveNotEdit)and(cdsMain.F_UniqueKey<>'')then
  if (cdsMain.State=dsInsert)or(cdsMain.UpdateStatus=usInserted) then
    cdsMain.FieldByName(cdsMain.F_UniqueKey).ReadOnly:=false
  else
    cdsMain.FieldByName(cdsMain.F_UniqueKey).ReadOnly:=true;
end;

procedure TToolbar_f.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DropDown_Info_list);
end;

procedure TToolbar_f.FormKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  if Key = #13 then
  begin 
    Key := Char(0);
    Perform(WM_NEXTDLGCTL, 0, 0);
  end;
end;

procedure TToolbar_f.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  SaveColsInfo(Self,UserRKEY);
end;

end.
