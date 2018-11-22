unit PublicUnit;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,StrUtils,
  Dialogs, ImgList, StdCtrls, Buttons, comobj,ToolWin, DBCtrls, ComCtrls, DB, Grids,ADODB,
    DBGrids, ExtCtrls ,DBGridEh,DBCtrlsEh ;

  procedure MsgError(AHandle:THandle;Msg:string);
  procedure MsgWarning(AHandle:THandle;Msg:string);
  procedure MsgInfo(AHandle:THandle;Msg:string);
  procedure MyError(msg:string);
  procedure MyWarning(msg:string);
  procedure MyInfo(msg:string);
  procedure EditExitNull(sender:Tobject);
  procedure ComboboxExitNull(sender:Tobject);
  procedure SaveMsg;
  procedure outputExcel(DBGrid1:TDBGridEh;FileName:String;labelName:string='');
  //procedure SaveErrMsg;
  procedure CheckStr(Edit1:TCustomEdit;name:string='');
  procedure comboboxAddItems(mycom:TCustomComboBox;mysql:string);
  function  PrimKeyExists(Sql:string):boolean;
  procedure SaveToExcel(DBGrid1:TDBGridEH;savedialog1:tsavedialog;row:integer=2;col :integer=2);
  procedure ADODataSetAddToComboboxItems(qu:TCustomADODataSet;co:TCustomComboBox;FieldName:string);
  procedure CLS(FormName:Tform);
  procedure KeyPressDBGridEH(Sender: TDBGridEh; var Key: Char;F:TForm) ;
  procedure FormDataSetClose(ds:TCustomADODataSet);
  procedure EnterEdit(c1:TCustomEdit;C2:TWinControl;var Key: Char;NotNull:bool=true);
  procedure EnterCombobox(c1:TCustomComboBox;C2:TWinControl;var Key: Char;NotNull:bool=true);
  procedure EF(FormName:Tform);
  procedure ET(FormName:Tform);
  procedure DataSetToEdit(ds:TCustomADODataSet);
  Function  GridPressEnterFieldNull(F:TForm;DBGrid1:TDBGrid;Col1,Col2:integer;
               var Key: Char;Col1NotNull:bool=False):bool;
  Function  AsSumQ(MyAs:TCustomADODataSet;FieldName:string):currency;//currency  是8字节的浮点实数类型
  Function  AddSQL(S:String):String;
  Function  IsInt(Int:string=''):bool;
  procedure IsIntMsg(Int:String='';msg:string='');
  Function  IsDate(Dt:String=''):Bool;
  procedure IsDateMsg(Dt:String='';msg:string='');
  Function  IsFloat(Fl:String=''):Boolean;
  procedure IsFloatMsg(Fl:String='';msg:string='');
  procedure OpenLookForm(Fm:TForm;Gd:TDBGrid;var Key: Char;SelectedFieldName:string;LooktableName:string;LookFields1,LookFields2:string;LookFields3:string='');
 // Function  ResultGridFieldID(Dgh:TDBGridEH;fieldname:string):integer;
  procedure AddFixFields(tableName:string;DgEh:TdbgridEH;SQLWhere:string='');
  procedure AddLookupFields(DgEh:TDBGridEH;DtLook:TObject;QryR:TADODataSet;FN:string;DL:string;KF:string;LF:string;LRF:string;FSize:integer=20);
  procedure BeforeInsertCheck(LB:TLabel);
  procedure BeforeEditCheck(LB:TLabel);
  procedure BeforeDeleteCheck(LB:TLabel);
  procedure BeforePostCheck(LB:TLabel);
  Function  PrintCheck(LB:TLabel):bool;
  Function  OutCheck(LB:TLabel):bool;
  procedure ColumnAddList(DghName:TDBGridEH;DghColName:string;SQL: string);
  procedure ColNotVisi(DghName:TDBGridEH;ColunmsName:array of string);
  procedure ColReadOnly(DghName:TDBGridEH;ColunmsName:array of string);
  procedure FormCaption(TableName:string;T:TForm);
  procedure DghColExitNotNull(Sender: TDBGridEh);
  procedure PostFieldNotNull(DataSet: TDataSet;F:TForm);
  procedure ColExitForeKeyCheck(KeyFieldName:string;ForeignTableName:string;ForeKeyField:string;Sender: TObject;SQLWhere:string='');
  procedure ColExitUniqueCheck(KeyFieldName:string;TableName:string;Sender: TObject;SQLWhere:string='');
  procedure PostForeKeyExistsCheck(DataSet:TDataSet;TableName:string);
  procedure PostUniqueCheck(DataSet:TDataSet;TableName:string);
  procedure AddLookFields(F:TForm;DgEh:TDBGridEH;DtLookName:string;TableName:array of string;KeyFields,LookupKeyFields:string;
             FieldName,LookupResultFields:array of string;SQL:string='';DtReadOnly:Boolean=True;DisplayLast:Boolean=False);
  procedure ClearSpace(Sender :TDBGridEh)   ;
  procedure DefaultValue(DataSet:TADODataSet;FieldsName:array of string;FieldValue:array of Variant)   ;
  procedure LoadColCaption(TableName:array of string;DgEh:TdbgridEH);
  procedure NotNull(Dgh:TDBGridEh;FieldsName:array of string);
  procedure NewNumb(Dt0004:TADODataSet);
  Function  AuditCheck(LB:TLabel):bool;
  procedure DghReadOnlyFocus(Sender :TDBGridEh);
  procedure ColNotReadOnlyFocus(F:TForm;Ds:TDataSet);
  procedure OperBefoCheck(Dgh:TDBGridEh;FieldName:string;FieldValue: array of Variant;msg:string;FieldNotValue:Boolean=False);
  Function  IsNumberic(Vaule:String):Boolean; //判断Vaule是不是数字
  Function  IsUpperCase(Vaule:String):Boolean; //判断Vaule 是不是大写字母
  Function  IsLowerCase(Vaule:String):Boolean; //判断Vaule 是不是小写字母
  Function  IsEnCase(Vaule:String):boolean; //判断Vaule 是不是字母
  procedure DghLoadFields(F:TForm;TableName,ProgName:string;Dt:TADODataSet;EMPLOYEE_PTR:string);
  procedure FormColumnAddList(F:TForm;DghColName:string;SQL: string);
  procedure FormAddLookFields(F:TForm;Dt:TADODataSet;DtLookName:string; TableName:array of string;KeyFields,LookupKeyFields:string;
                              FieldName,LookupResultFields:array of string;FieldsDisplayLabel:array of string;SQL:string='';KeyFieldVisible:Boolean=True);
  procedure FormColReadOnly(F:TForm;Dt:TADODataSet;ColunmsName:array of string);
  procedure FormColNotVisi (F:TForm;Dt:TADODataSet;ColunmsName:array of string);
  procedure AddDateCalculatedField(Dgh:TDBGridEh;CalculateFieldName,DisplayLabel,PriorFieldName:string);
  procedure PrimaryCheck(TableName:string;dt:TADODataSet;F:TForm);
  procedure ReferenceCheck(TableName:string;Dt:TADODataSet;F:TForm);
  procedure EditForeignKeyCheck(TableName:string;Dt:TADODataSet;F:TForm);
  procedure BeforeDeleteForeignKeyCheck(TableName:string;Dt:TADODataSet;F:TForm);
  procedure FieldGetText(Sender: TField;var Text: String;LocateDataSet:TADODataSet;KeyField,DisplayField:string);
  procedure RKeyGetEmployee_Name(Sender: TField;var Text: String);
  Function  GetDataBaseDate(FDataSet:TADOQuery;TType:Integer=1):TDateTime;
  procedure SenderMsg(DtUserRkey:TADODataSet;Msg:string);
  Function  SQLResultValue(SQL:string):string;
  procedure FieldsNotNull(Dt: TCustomADODataSet;FieldName:array of string);
  procedure PopupLookupForm(DtLookup,InputDt:TADODataSet;LookupField,InputField:string;InputDBComponents:TWinControl;TablesName:array of string);
  procedure DBComponentsReadOnly(F:TForm;FieldName:array of string;ReadOnly:Boolean=True) ;
  procedure DBComponentsAllReadOnly(F:TForm;Dt:TADODataSet;ReadOnly:Boolean=True);
  procedure LoadFieldsDisplayLabel(TablesName:array of string;dt:TADODataSet;strSQL:string='');
  procedure AddFieldsLabel(TableName:string;DGEH:TDBGridEh;SQLWhere:string='');
  procedure FormGridSet(F:TForm;TableName ,ProgName:string;Dt:TADODataSet;Dgh:TDBGridEh;UserID:string;IdenNotDisp:Boolean=true);
  procedure FormLabelSet(F:TForm;Dt:TADODataSet);
  procedure AutoAddField(F:TForm);
  procedure AutoDeleteField(F:TForm);

  procedure UsFieldDisplaySave(ProgName,TableName,Employee_ptr,FormCaption:string;SaveGridEH:TDBGridEh;DtusSysFieldSet,SourceDataSet:TADODataSet);
//  const RDatetime      = 1 ;
//        RSmallDatetime = 2 ;
//        RDate          = 3 ;
 // procedure TestDghLoadFields(F:TForm;TableName,ProgName:string;EMPLOYEE_PTR:string);
 { const      D   =   8.5;  //全局常量，定义的每天8。5小时。 如果以后时间有更改，只要在此处更改。

  var user:string;
      VCopy:variant;
      ShengChanHuo:string;
      JiHuaDate:Tdate;    }
     var Info_FieldNotNull:string='字段不能为空';
         fRight,user_ptr,vprev,db_ptr:string;
implementation

//uses  ItemList; //,   ItemListUnit   ModuleUnit,



procedure AutoDeleteField(F:TForm);
var
  Qry:TADOQuery;
  CmdUpdate:TADOCommand;
  TableRkey:Integer;
begin

  Qry:=TADOQuery.Create(f);
  Qry.Connection:=DM.ADOConnection1;
  Qry.SQL.Text:='select * from usFormData as ds  join Data0419 as d9 on d9.RKEY=ds.[usForm_Rkey] '
        +'where d9.PROGRAME='+QuotedStr(f.Name)  ;
  Qry.Open;
  while not Qry.Eof do
  begin
    if F.FindComponent(Qry.FieldByName('DataSetName').AsString)=nil then  //如果数据集在当前窗口中已不存在 ，删除
    begin
      CmdUpdate:=TADOCommand.Create(f);
      CmdUpdate.Connection:=DM.ADOConnection1;
      CmdUpdate.CommandText:='delete usDataSetAllField where usFormData_rkey='+Qry.FieldByName('rkey').Value;
      //ShowMessage(CmdUpdate.CommandText);
      CmdUpdate.Execute;

      Qry.Delete;
      Break;
    end
    else
    begin
      if F.FindComponent(Qry.FieldByName('DataSetName').AsString) is TAdoData then
      with F.FindComponent(Qry.FieldByName('DataSetName').AsString) as TAdoData do
      begin
        TableRkey:=StrToInt(SQLResultValue(' select rkey from usTableName where TableName='
           +QuotedStr(FTableName)))  ;
        if Qry.FieldByName('usTableName_rkey').Value<>TableRkey then
        begin
          CmdUpdate:=TADOCommand.Create(f);
          CmdUpdate.Connection:=DM.ADOConnection1;
          CmdUpdate.CommandText:='delete usDataSetAllField where usFormData_rkey='+Qry.FieldByName('rkey').AsString;
          ShowMessage(CmdUpdate.CommandText);
          CmdUpdate.Execute;
          Qry.Edit;
          Qry.FieldByName('usTableName_rkey').Value:=TableRkey ;
          Qry.Post;
        end;
      end;
    end;
    Qry.Next;
  end;
end;

procedure AutoAddField(F:TForm);
var
  i,fc,TableRkey,FormRkey,FormDataRkey:Integer;
  SQL:string;
  sp_addField:TADOStoredProc ;
  cmdUpdate:TADOCommand;
begin
  FormRkey:= StrToInt(SQLResultValue(' select rkey from Data0419 where PROGRAME='+QuotedStr(F.Name))) ;
  cmdUpdate:=TADOCommand.Create(f);
  cmdUpdate.Connection:=DM.ADOConnection1;
  sp_addField:=TADOStoredProc.Create(f) ;
  sp_addField.Connection:=DM.ADOConnection1;
  sp_addField.ProcedureName:= 'sp_addField';
  sp_addField.Parameters.Refresh;
  FormDataRkey:=0;
  for i:=0 to f.ComponentCount-1 do
  begin
    if f.Components[i] is TDataSource then
    with f.Components[i] as TDataSource do
    begin
      TableRkey:=StrToInt(SQLResultValue(' select rkey from usTableName where TableName='
           +QuotedStr((DataSet as TAdoData).FTableName)))  ;
      SQL:='select * from usFormData as ds  join Data0419 as d9 on d9.RKEY=ds.[usForm_Rkey] '
        +'where d9.PROGRAME='+QuotedStr(f.Name)
        +' and DataSetName='+QuotedStr(DataSet.Name);

      if PrimKeyExists(SQL)=False then     //如果数据集在数据库中不存在插入
      begin
        SQL:='insert into usFormData([usForm_Rkey],[usTableName_rkey],[DataSetName]) values ( '
        +IntTostr(FormRkey)+','+IntTostr(TableRkey)+','+ QuotedStr(DataSet.Name)+')';
        cmdUpdate.CommandText:=SQL;
        cmdUpdate.Execute;
      end;
      begin
        SQL:= 'select usFormData.RKEY from usFormData join Data0419 '
           + 'on usFormData.usForm_Rkey=Data0419.RKEY where Data0419.PROGRAME='+QuotedStr(F.Name)
           +' and DataSetName='+QuotedStr(DataSet.Name);
        FormDataRkey:= StrToInt(SQLResultValue(SQL));
      end ;
      for fc:=0 to DataSet.FieldCount-1 do
      begin
        sp_addField.Close;
        sp_addField.Parameters.ParamByName('@usFormData_rkey').Value:=FormDataRkey ;
        sp_addField.Parameters.ParamByName('@FieldName').Value:=DataSet.Fields[fc].FieldName  ;
        sp_addField.ExecProc ;
      end;
    end;
  end;
end;

procedure UsFieldDisplaySave(ProgName,TableName,Employee_ptr,FormCaption:string;SaveGridEH:TDBGridEh;DtusSysFieldSet,SourceDataSet:TADOdataset);
var
 j :Integer;
 CmdUpdate:TADOCommand;
begin
{ SQL:= 'if exists(select * from usSysfieldset where ProgName= :pProgName and EMployee_ptr= :pEMployee_ptr and CompName= :pCompName)'
       +'Delete   from usSysfieldset where ProgName= :pProgName and EMployee_ptr= :pEMployee_ptr and CompName= :pCompName ';
       cmdUpdate.CommandText:=SQL;
       cmdUpdate.Parameters.ParamByName('pProgName').DataType:=ftString;
       cmdUpdate.Parameters.ParamByName('pProgName').Value:=MainForm.ProgName;
       cmdUpdate.Parameters.ParamByName('pEMployee_ptr').DataType:=ftInteger;
       cmdUpdate.Parameters.ParamByName('pEMployee_ptr').Value := StrToInt(mainForm.user_ptr.Caption) ;
       cmdUpdate.Parameters.ParamByName('pCompName ').DataType:=ftString  ;
       cmdUpdate.Parameters.ParamByName('pCompName ').Value :=TDBGrideh(MainForm.ActiveControl).Name  ;
       cmdUpdate.Execute;  }
   CmdUpdate:=TADOCommand.Create(nil);
   CmdUpdate.Connection:=DM.ADOConnection1;
   CmdUpdate.CommandText:='if exists(select * from usSysfieldset1 where ProgName= '
   +Quotedstr(ProgName)+' and EMployee_ptr= '+Quotedstr(EMployee_ptr)+')'
   +' Delete  usSysfieldset1 where ProgName= '
   +Quotedstr(ProgName)+' and EMployee_ptr= '+Quotedstr(EMployee_ptr);
   CmdUpdate.Execute;
   CmdUpdate.CommandText:='if not exists(select* from dbo.usSysProgName where ProgName= '
                         +Quotedstr(ProgName)+')'
                         +'insert into dbo.usSysProgName values ('
                         +Quotedstr(ProgName)+','
                         +Quotedstr(FormCaption)+')';
   CmdUpdate.Execute;
  j:=0;
  if DtusSysFieldSet.Active=False then DtusSysFieldSet.Open;
  try
  SourceDataSet.DisableControls;
  SourceDataSet.First;
  while not( SourceDataSet.Eof)   do
  begin
    if SourceDataSet.FieldByName('b').AsBoolean=True then
    begin
      DtusSysFieldSet.Append;
      DtusSysFieldSet.FieldByName('ProgName').AsString:=ProgName;
      DtusSysFieldSet.FieldByName('UseTableName').AsString:=TableName;
      DtusSysFieldSet.FieldByName('FieldName').AsString:=SourceDataSet.FieldByName('FieldName').AsString;
      DtusSysFieldSet.FieldByName('FieldOrder').AsInteger:=SaveGridEH.FieldColumns[SourceDataSet.FieldByName('FieldName').asString].Index;
      if  SaveGridEH.FindFieldColumn(SourceDataSet.FieldByName('FieldName').AsString)<>nil then
         begin
            DtusSysFieldSet.FieldByName('GridWidth').AsInteger:=
              SaveGridEH.FieldColumns[SourceDataSet.FieldByName('FieldName').AsString].Width;
         end;
      DtusSysFieldSet.FieldByName('EMPLOYEE_PTR').AsInteger:= StrToInt(EMPLOYEE_PTR) ;
      DtusSysFieldSet.Post;
      j:=j+1;
    end;
    SourceDataSet.Next;
  end;
  finally
  SourceDataSet.EnableControls;
  MyInfo('选择的字段已成功保存!');
  end;
end;

procedure FormLabelSet(F:TForm;Dt:TADODataSet);
var
  i:Integer;
begin
  for i:=0 to  f.ComponentCount-1 do
  begin
    if f.Components[i] is TLabel then
      begin
      if dt.FindField((f.Components[i] as TLabel).Caption)<>nil then    //如果在数据集上找到该字段，
      begin
        if Dt.FieldByName((f.Components[i] as TLabel).Caption).Required then
        (f.Components[i] as TLabel).Font.Color:=clBlue;            //就 设为蓝色字体
        (f.Components[i] as TLabel).Caption:=Dt.FieldByName((f.Components[i] as TLabel).Caption).DisplayLabel;   //设置为中文字段名
      end ;
      end
    else
    if f.Components[i] is TDBCheckBox then
      if Dt.FindField((f.Components[i] as TDBCheckBox).Caption)<>nil then    //如果在数据集上找到该字段，
      begin
        (f.Components[i] as TDBCheckBox).Caption:=Dt.FieldByName((f.Components[i] as TDBCheckBox).Caption).DisplayLabel;   //设置为中文字段名
      end ;
  end
end;

procedure FormGridSet(F:TForm;TableName ,ProgName:string;Dt:TADODataSet;Dgh:TDBGridEh;UserID:string;IdenNotDisp:Boolean=true);
var
  i:Integer;
begin
  Dt.Open;
  begin
    DM.DtUsFieldDispSet1.Close;
    DM.DtUsFieldDispSet1.Parameters.ParamByName('@TableName').Value:=TableName ;
    DM.DtUsFieldDispSet1.Parameters.ParamByName('@ProgName').Value:= ProgName ;
   // DM.DtUsFieldDispSet1.Parameters.ParamByName('@CompName').Value:= 'CompName';
    DM.DtUsFieldDispSet1.Parameters.ParamByName('@EMPLOYEE_PTR').Value:=StrToInt(UserID);
    DM.DtUsFieldDispSet1.Open;
   // ShowMessage(IntToStr(DM.spDtFieldSet.RecordCount));
    with Dgh do
    begin
      ShowHint:=True;
      I:=0;
      if DM.DtUsFieldDispSet1.RecordCount>0 then
      begin
        Columns.Clear;   //清除已有的固定字段。
        DM.DtUsFieldDispSet1.First;
        while not (DM.DtUsFieldDispSet1.Eof) do
          begin
             // ShowMessage('0');
            if (DM.DtUsFieldDispSet1.FieldByName('InGrid').AsBoolean=True)and
              ((DM.DtUsFieldDispSet1.FieldByName('colstat').Value=0)or((DM.DtUsFieldDispSet1.FieldByName('colstat').Value=1)and(IdenNotDisp=False ))) then     //GRID控件动态添加字段。
              begin
          //     ShowMessage('1');
              Columns.Add;
              Columns[i].FieldName:= DM.DtUsFieldDispSet1.FieldByName('FieldName').AsString;
              if not(DM.DtUsFieldDispSet1.FieldByName('GridWidth').IsNull) then
                  Columns[i].Width:= DM.DtUsFieldDispSet1.FieldByName('GridWidth').AsInteger;  //设置GRID控件的字段宽度
              if not(DM.DtUsFieldDispSet1.FieldByName('GridVisi').IsNull)then
              if DM.DtUsFieldDispSet1.FieldByName('GridVisi').AsBoolean=false then
                  Columns[i].Visible:=false;    //ifend     //设置GRID控件的字段不可见
              Columns[i].Title.Hint:='用%号模糊过滤';
              if DM.DtUsFieldDispSet1.FieldByName('TitleButton').AsBoolean=True then
                  begin
                  Columns[i].Title.TitleButton:=True;
                  if Columns[i].Title.Hint<>'' then
                     Columns[i].Title.Hint:=Columns[i].Title.Hint+#10#13+'支持单击排序'
                  else
                     Columns[i].Title.Hint:='支持单击排序'  ;
                  end;
              if DM.DtUsFieldDispSet1.FieldByName('ReadOnly').AsBoolean then
                     Columns[i].ReadOnly:=True;
              if DataSource.DataSet.FieldByName(DM.DtUsFieldDispSet1.FieldByName('FieldName').AsString).Required then
                  begin
                  Columns[i].Title.Font.Color:=clBlue;   //蓝色字体显示
                  if (Columns[i].Title.Hint)<>'' then  //如果提示字符串不是空，
                      Columns[i].Title.Hint:=  Columns[i].Title.Hint+#10#13+'字段不能为空'
                  else
                       Columns[i].Title.Hint:='字段不能为空'; //提示
                  end;
              i:=i+1;
              end;
            DM.DtUsFieldDispSet1.Next;
          end ;
      end;
    end;
  end;
  DM.DtUsFieldDispSet1.Close;
end;

procedure AddFieldsLabel(TableName:string;DGEH:TDBGridEh;SQLWhere:string='');
var
fnCN:TADODataSet;
i:integer;
begin
 //功能：数据集动态添加固定中文字段名。
  With DGEH.DataSource.DataSet  do
  begin
    Fields.Clear ;
    TDataSetDesigner.Create(DGEH.DataSource.DataSet);
    Try
    Designer.BeginDesign;
      For i:=0 to FieldDefList.Count-1 do    
      begin
        FieldDefList.FieldDefs[i].CreateField(DGEH.DataSource.DataSet ); //保留原有字段
      end;
  //新增一个字段
{with DB.DefaultFieldClasses[TFieldType(2)].Create(DGEH.DataSource.DataSet as TADODataSet) do
begin
FieldKind:=TFieldKind(1);
FieldName:='FieldName1';
Name:='FieldName1';
DataSet:=DGEH.DataSource.DataSet as TADODataSet;
end;   }
    Finally
    Designer.EndDesign;
    Designer.Free;
    end;
  end;
  fnCN:=TADODataSet.Create(nil);
  fnCN.Connection:= DM.ADOConnection1;  //查询系统表字段名对应自定义中文字段名称。c.colstat:是否是自动增长字段。
      fnCN.CommandText:='select i.colid,FieldNameCN,c.IsNullable,c.Name as FieldName,c.colstat,c.cdefault'//--,GridWidth,GridVisi,TitleButton,ReadOnly,FieldOrder
      +' from dbo.sysobjects o join dbo.syscolumns c on o.id=c.id '
      +' left join sysindexkeys i on c.id=i.id and c.colid=i.colid '
      +' left outer join dbo.usSYSFieldName on c.name =FieldName and o.name=tablename '
      +' Where O.name = '+quotedStr(TableName)
      +' order by FieldOrder';
  fnCN.Open; //打开中文字段名表

  with DGEH.DataSource.DataSet as TADODataSet do
  begin
  Close;
  Fields.Clear;
  CommandText:='select * from '+TableName+#10#13+sqlwhere;
  Open;
  
  i:=0   ;
    while not  fnCN.Eof  do
    begin
    if FindField(fnCN.fieldByName('FieldName').AsString) <>nil then
      begin                                         //  or
        if not ((fnCN.fieldByName('FieldNameCN').IsNull) and(fnCN.fieldByName('FieldNameCN').AsString='') )then
          FindField(fnCN.fieldByName('FieldName').AsString).DisplayLabel:=fnCN.fieldByName('FieldNameCN').Value;
        if (fnCN.FieldByName('IsNullable').Value=0 )or (not fnCN.FieldByName('colid').IsNull ) then//字段不能为空或字段定义为索引
          if(fnCN.FieldByName('colstat').Value=0)and(fnCN.FieldByName('cdefault').Value=0)then     //  如果是不自动增长列或字段没有设置默认值
          begin
            FindField(fnCN.fieldByName('FieldName').AsString).Required:=True;
          //  DGEH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Font.Color:=clBlue;   //蓝色字体显示
          end;
        FindField(fnCN.fieldByName('FieldName').AsString).Index:=i;
        i:=I+1 ;
      end;
      fnCN.Next;
    end;
  end;
   {
DgEh.DataSource.DataSet.Close;
DgEh.DataSource.DataSet.Fields.Clear;
(DgEh.DataSource.DataSet as TADODataSet).CommandText:='select *  from '+tableName+#10#13;
(DgEh.DataSource.DataSet as TADODataSet).Open;

temQry:=TADODataSet.Create(nil);
temQry.Connection:= DM.ADOConnection1;

fnCN:=TADODataSet.Create(nil);
fnCN.Connection:= DM.ADOConnection1;

//查询系统表字段名对应自定义中文字段名称。
      fnCN.CommandText:='select i.colid,FieldNameCN,c.IsNullable,c.Name as FieldName,c.colstat,c.cdefault,GridWidth,GridVisi,TitleButton,ReadOnly,FieldOrder'
      +' from dbo.sysobjects o join dbo.syscolumns c on o.id=c.id '
      +' left join sysindexkeys i on c.id=i.id and c.colid=i.colid '
      +' left outer join dbo.usSYSFieldName on c.name =FieldName and o.name=tablename '
      +' Where O.name = '+quotedStr(TableName)
      +' order by FieldOrder';
fnCN.Open; //打开中文字段名表


   temQry.clone((DgEh.DataSource.DataSet as TADODataSet),ltReadOnly);
   DgEh.DataSource.DataSet.Close;
   (DgEh.DataSource.DataSet as TADODataSet).Fields.Clear;
   for i := 0 to (temQry.FieldDefs.Count) - 1 do    //循环
   begin
      with DgEh.DataSource.DataSet.FieldDefs.Items[i].FieldClass.Create(nil) do
      begin
         FieldName := temQry.FieldDefs.Items[i].name;
         if  fnCN.FieldByName('FieldNameCN').AsString<>''then
         DisplayLabel :=fnCN.FieldByName('FieldNameCN').AsString;  // 添加中文字段名  ，特别说明，数据集的中文字段
 //        if fnCN.FieldByName('IsNullable').AsInteger=0 then  //如果数据库的字段不能为空，就设数据集字段不可为空的属性为真。
 //        Required:=True;
         size := temQry.FieldDefs.Items[i].size;

         if (fnCN.FieldByName('IsNullable').Value=0 )or (not fnCN.FieldByName('colid').IsNull ) then//字段不能为空或字段定义为索引
          if(fnCN.FieldByName('colstat').Value=0)and(fnCN.FieldByName('cdefault').Value=0)then     //  如果是不自动增长列或字段没有设置默认值
          begin
            Required:=True;
          end;
         Index := i;
         DataSet := DgEh.DataSource.DataSet;
         fnCN.Next;
      end;
   end; }

end; {
var
  fnCN:TADODataSet;         //功能：设当前数据集的中文字段名、字段顺序、不可为空。
  i:Integer;
begin
  fnCN:=TADODataSet.Create(nil);
  fnCN.Connection:= DM.ADOConnection1;  //查询系统表字段名对应自定义中文字段名称。c.colstat:是否是自动增长字段。
      fnCN.CommandText:='select i.colid,FieldNameCN,c.IsNullable,c.Name as FieldName,c.colstat,c.cdefault--,GridWidth,GridVisi,TitleButton,ReadOnly,FieldOrder'
      +' from dbo.sysobjects o join dbo.syscolumns c on o.id=c.id '
      +' left join sysindexkeys i on c.id=i.id and c.colid=i.colid '
      +' left outer join dbo.usSYSFieldName on c.name =FieldName and o.name=tablename '
      +' Where O.name = '+quotedStr(TableName)
      +' order by FieldOrder';
  fnCN.Open; //打开中文字段名表
  DGH.ShowHint:=True;
  with DGH.DataSource.DataSet as TADODataSet do
  begin
  Close;
  Fields.Clear;
  CommandText:='select * from '+TableName+#10#13+sqlwhere;
  Open;
    while not  fnCN.Eof  do
    begin


    end;
  end;

 with DGH.DataSource.DataSet as TADODataSet do
  begin
  Close;
  Fields.Clear;
  CommandText:='select * from '+TableName+#10#13+sqlwhere;
  Open;

  i:=0   ;
    while not  fnCN.Eof  do
    begin
    if FindField(fnCN.fieldByName('FieldName').AsString) <>nil then
      begin
      if not fnCN.fieldByName('FieldNameCN').IsNull  then
      FindField(fnCN.fieldByName('FieldName').AsString).DisplayLabel:=fnCN.fieldByName('FieldNameCN').Value;
      FindField(fnCN.fieldByName('FieldName').AsString).Index:=i;
      DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Hint:= '用%模糊过滤'  ;
      if (fnCN.FieldByName('IsNullable').Value=0 )or (not fnCN.FieldByName('colid').IsNull ) then//字段不能为空或字段定义为索引
        if(fnCN.FieldByName('colstat').Value=0)and(fnCN.FieldByName('cdefault').Value=0)then     //  如果是不自动增长列或字段没有设置默认值
        begin
          FindField(fnCN.fieldByName('FieldName').AsString).Required:=True;
          DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Font.Color:=clBlue;   //蓝色字体显示
          if Trim(DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Hint)<>'' then  //如果提示字符串不是空，
             DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Hint:=
                DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Hint+#10#13+'字段不能为空'
          else
             DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Hint:='字段不能为空';
        end;
      if IdenNotDisp then
        if fnCN.fieldByName('colstat').Value=1 then    //如果该字段是自动增长列,设该字段不可见
           DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Visible:=False;
      if not(fnCN.FieldByName('GridWidth').IsNull) then
         DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Width:= fnCN.FieldByName('GridWidth').AsInteger;  //设置GRID控件的字段宽度
      if not(fnCN.FieldByName('GridVisi').IsNull)then
         if fnCN.FieldByName('GridVisi').AsBoolean=false then
            DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Visible:=false;    //ifend     //设置GRID控件的字段不可见
      if fnCN.FieldByName('TitleButton').AsBoolean=True then
          begin
            DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.TitleButton:=True;
            if Trim(DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Hint)<>'' then  //如果提示字符串不是空，
               DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Hint:=
                    DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Hint+#10#13+'支持单击排序'
            else
            DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].Title.Hint:='支持单击排序'  ;
          end;
      if fnCN.FieldByName('ReadOnly').AsBoolean then
         DGH.FieldColumns[fnCN.fieldByName('FieldName').AsString].ReadOnly:=True;

      end;
      i:=I+1 ;
      fnCN.Next;
    end;
  end;     
  fnCN.Free;
end;     }

procedure LoadFieldsDisplayLabel(TablesName:array of string;dt:TADODataSet;strSQL:string='');
var
fnCN:TADODataSet;
i:integer;
TNS:string;
begin
 //功能：数据集动态添加固定中文字段名。
  if strSQL<>'' then
  begin
    dt.Close;
    dt.CommandText:=strSQL;
  end;
  if dt.Active=False then
  dt.Open;

  TNS:='Where u.TableName = '+quotedStr(TablesName[0]);
  for i:=1 to High(TablesName) do
  begin
    TNS:=TNS+' or  u.TableName = '+  quotedStr(TablesName[i]) ;
  end;

fnCN:=TADODataSet.Create(nil);
fnCN.Connection:= DM.ADOConnection1;

//查询系统表字段名对应自定义中文字段名称。                                //
fnCN.CommandText:='select FieldName,isnull(FieldNameCN,c.name)as FieldNameCN,'
                  +' isnull(GridWidth,c.length*10)as GridWidth  '
                  +' from dbo.usSYSFieldName u left join dbo.sysobjects o on u.tablename=o.name   '
                  +' join dbo.syscolumns c on o.id=c.id and  c.name =FieldName '+TNS+' order by FieldOrder ';


fnCN.Open; //打开中文字段名表
try
   for I := dt.FieldCount-1 downto 0 do    //循环
   begin
   if fnCN.Locate('FieldName',dt.FieldList[i].FieldName,[]) then
     begin
     dt.FieldList[i].DisplayLabel:=fnCN.FieldByName('FieldNameCN').Value;
     dt.FieldList[i].DisplayWidth:=fnCN.FieldByName('GridWidth').Value;
     end;
   end;
 finally
   fnCN.Free;
 end;
end;

procedure DBComponentsAllReadOnly(F:TForm;Dt:TADODataSet;ReadOnly:Boolean=True);
var
  j:Integer;
begin
  for j:=0 to  F.ComponentCount-1 do
  begin
    if f.Components[j] is TDBEdit then
    begin
      if  (f.Components[j] as TDBEdit).DataSource.DataSet=Dt  then
      begin
            if ReadOnly then
              begin
              (f.Components[j] as TDBEdit).readonly:=True;
              (f.Components[j] as TDBEdit).Color:=clScrollBar;
              end
            else
              begin
              (f.Components[j] as TDBEdit).readonly:=False;
              (f.Components[j] as TDBEdit).Color:=clWindow;
              end;
      end;
    end
    else
    if f.Components[j] is TDBMemo then
    begin
      if  (f.Components[j] as TDBMemo).DataSource.DataSet=Dt  then
      begin
            if ReadOnly then
              begin
              (f.Components[j] as TDBMemo).readonly:=True;
              (f.Components[j] as TDBMemo).Color:=clScrollBar;
              end
            else
              begin
              (f.Components[j] as TDBMemo).readonly:=False;
              (f.Components[j] as TDBMemo).Color:=clWindow;
              end;
      end;
    end
    else
    if f.Components[j] is TDBComboBox then
    begin
      if  (f.Components[j] as TDBComboBox).DataSource.DataSet=Dt  then
      begin
            if ReadOnly then
              begin
              (f.Components[j] as TDBComboBox).readonly:=True;
              (f.Components[j] as TDBComboBox).Color:=clScrollBar;
              end
            else
              begin
              (f.Components[j] as TDBComboBox).readonly:=False;
              (f.Components[j] as TDBComboBox).Color:=clWindow;
              end;
      end;
    end
    else
    if f.Components[j] is TDBDateTimeEditEh then
    begin
      if  (f.Components[j] as TDBDateTimeEditEh).DataSource.DataSet=Dt  then
      begin
            if ReadOnly then
              begin
              (f.Components[j] as TDBDateTimeEditEh).readonly:=True;
              (f.Components[j] as TDBDateTimeEditEh).Color:=clScrollBar;
              end
            else
              begin
              (f.Components[j] as TDBDateTimeEditEh).readonly:=False;
              (f.Components[j] as TDBDateTimeEditEh).Color:=clWindow;
              end;
      end;
    end
  end;
end;

procedure DBComponentsReadOnly(F:TForm;FieldName:array of string;ReadOnly:Boolean=True) ;
var
  i,j:Integer;
begin
  for i:=0 to Length(FieldName) do
  begin
    for j:=0 to  F.ComponentCount-1 do
    begin
      if f.Components[j] is TDBEdit then
        begin
        if UpperCase((f.Components[j] as TDBEdit).DataField) =UpperCase(FieldName[i]) then
          begin
            if ReadOnly then
              begin
              (f.Components[j] as TDBEdit).readonly:=True;
              (f.Components[j] as TDBEdit).Color:=clScrollBar;
              end
            else
              begin
              (f.Components[j] as TDBEdit).readonly:=False;
              (f.Components[j] as TDBEdit).Color:=clWindow;
              end;
          end
        end
      else
      if f.Components[j] is TDBMemo then
        begin
         if UpperCase((f.Components[j] as TDBMemo).DataField) =UpperCase(FieldName[i]) then
          begin
            if ReadOnly then
              begin
              (f.Components[j] as TDBMemo).readonly:=True;
              (f.Components[j] as TDBMemo).Color:=clScrollBar;
              end
            else
              begin
              (f.Components[j] as TDBMemo).readonly:=False;
              (f.Components[j] as TDBMemo).Color:=clWindow;
              end;
          end ;
        end
      else
      if f.Components[j] is TDBComboBox then
        begin
         if UpperCase((f.Components[j] as TDBComboBox).DataField) =UpperCase(FieldName[i]) then
          begin
            if ReadOnly then
              begin
              (f.Components[j] as TDBComboBox).readonly:=True;
              (f.Components[j] as TDBComboBox).Color:=clScrollBar;
              end
            else
              begin
              (f.Components[j] as TDBComboBox).readonly:=False;
              (f.Components[j] as TDBComboBox).Color:=clWindow;
              end;
          end ;
        end
      else
      if f.Components[j] is TDBDateTimeEditEh then
        begin
         if UpperCase((f.Components[j] as TDBDateTimeEditEh).DataField) =UpperCase(FieldName[i]) then
          begin
            if ReadOnly then
              begin
              (f.Components[j] as TDBDateTimeEditEh).readonly:=True;
              (f.Components[j] as TDBDateTimeEditEh).Color:=clScrollBar;
              end
            else
              begin
              (f.Components[j] as TDBDateTimeEditEh).readonly:=False;
              (f.Components[j] as TDBDateTimeEditEh).Color:=clWindow;
              end;
          end ;
        end;
    end;
  end;
end;

procedure PopupLookupForm(DtLookup,InputDt:TADODataSet;LookupField,InputField:string;InputDBComponents:TWinControl;TablesName:array of string);
begin
  if InputDBComponents is TDBEdit then
    begin
      if (InputDBComponents as TDBEdit).ReadOnly then   //如果输入控件的属性为只读，结束。
      Abort;
    end
  else
  if InputDBComponents is TDBComboBox then
    begin
      if (InputDBComponents as TDBComboBox).ReadOnly then   //如果输入控件的属性为只读，结束。
      Abort;   //
    end;
  if  DtLookup.Active=False then
  DtLookup.Open;

  Application.CreateForm(TItemList_f, ItemList_f);
  ItemList_f.Caption:=InputDt.FieldByName(InputField).DisplayLabel+' 选择';
  ItemList_f.FilterFieldName:=LookupField;
  ItemList_f.ds1.DataSet:=DtLookup;
 { for i:=0 to AddListForm.ds1.DataSet.FieldCount-1 do
  begin
    AddListForm.Dgh1.Columns[].(AddListForm.ds1.DataSet.FieldList[i].FieldName).Width:= AddListForm.ds1.DataSet.FieldList[i].DisplayWidth;
    ShowMessage('AddListForm.ds1.DataSet.FieldList[i].DisplayWidth'+IntToStr(AddListForm.ds1.DataSet.FieldList[i].DisplayWidth));
  end;   }

  if InputDBComponents is TDBEdit then
    begin
      ItemList_f.Edit1.Text := trim((InputDBComponents as TDBEdit).Text) ;
    end
  else
  if InputDBComponents is TDBComboBox then
    begin
      ItemList_f.Edit1.Text := trim((InputDBComponents as TDBComboBox).Text );
    end;

  LoadColCaption(TablesName,ItemList_f.dgh1);
  if  ItemList_f.ShowModal=mrOK then
  begin
    if DtLookup.RecordCount>0 then
    begin
    if  (InputDt.State<>dsInsert) or (InputDt.State<>dsEdit)then       //如果数据集的状态不是修改或插入，数据进入编辑
      InputDt.Edit;
    InputDt.FieldByName(InputField).Value:= DtLookup.FieldByName(LookupField).Value;
    end;
  end;
  InputDBComponents.SetFocus;
  ItemList_f.Free;
end;

procedure FieldsNotNull(Dt: TCustomADODataSet;FieldName:array of string);
var
  i:Integer;
begin
  for i:=0 to High( FieldName) do
  begin
    if (Dt.FieldByName(FieldName[i]).IsNull)
        or(Dt.FieldByName(FieldName[i]).AsString='') then
     begin
       myerror(Dt.FieldByName(FieldName[i]).DisplayLabel+': 该字段不能为空！');
       Abort;
     end;
  end;
end;

Function  SQLResultValue(SQL:string):string;
begin
  Result:='';
  DM.dtSQLResultValue.Close;
  DM.DtSQLResultValue.CommandText:=SQL;
  DM.DtSQLResultValue.Open;
  if DM.DtSQLResultValue.FieldList[0].IsNull  then
    Result:=''
  else
    Result:=DM.DtSQLResultValue.FieldList[0].Value;
end;

procedure SenderMsg(DtUserRkey:TADODataSet;Msg:string);
begin
 { if messagedlg('是否短信通知审批人员?', mtConfirmation, [mbYes, mbNo], 0) =mrYes then
  begin
    if DtUserRkey.RecordCount<1 then
    begin
      myerror('还没设置短信接收人！');
      Abort;

    end;
    if DM.DtData0014.Active =False then
      begin;
        DM.DtData0014.CommandText:='select * from data0014 where 1=2';
        DM.DtData0014.Open;
      end;
    if DM.DtData0314.Active =False then
      begin;
        DM.DtData0314.CommandText:='select * from data0314 where 1=2';
        DM.DtData0314.Open;
      end;

        DM.DtData0014.Append;
        DM.DtData0014.FieldValues['MESSAGE'] := Msg;
        DM.DtData0014.FieldValues['whosend'] := StrToInt(MainForm.user_ptr.Caption);
        DM.DtData0014.post;

        while not( DtUserRkey.Eof) do   //如果有多行记录，即有多个用户可对记录进行审核。
          begin
          DM.DtData0314.Append;
          DM.DtData0314.FieldValues['emp_ptr'] := DtUserRkey.FieldValues['user_ptr'];
          DM.DtData0314.FieldValues['d14_ptr'] := DM.DtData0014.FieldByName('Rkey').Value;
          DM.DtData0314.Post;
          DtUserRkey.Next;
          end;
  end;  }
end;

procedure RKeyGetEmployee_Name(Sender: TField;var Text: String);
begin
  if DM.dtdata0073.Active=False  then
  begin
    DM.DtData0073.CommandText:='select * from data0073';
    DM.DtData0073.Open;
  end;

  FieldGetText(Sender, Text,DM.DtData0073,'rkey','User_Full_Name');

end;

Function  GetDataBaseDate(FDataSet:TADOQuery;TType:Integer=1):TDateTime;
begin
  with FDataSet  do
  begin
    Close;
    if TType=1 then
      SQL.Text:='select GetDate()'
    else
    if TType=2 then
      SQL.Text:='select CONVERT(varchar(100), GETDATE(), 23)'
    else
    if TType=3 then
      SQL.Text:='select cast(getdate()as smallDatetime)';
    Open;
    Result:=FieldList[0].AsDateTime;
  end;
end;

procedure FieldGetText(Sender: TField;var Text: String;LocateDataSet:TADODataSet;KeyField,DisplayField:string);
begin
 if LocateDataSet.Active=False then LocateDataSet.Open;

 if  not( VarIsNull(Sender.Value)) then
   if LocateDataSet.Locate(KeyField,Sender.Value,[])then
     text:=LocateDataSet.FieldByName(DisplayField).AsString ;

end;

procedure BeforeDeleteForeignKeyCheck(TableName:string;Dt:TADODataSet;F:TForm);
var
  i :Integer;
  SQL,Msg,ConstID,FTableName:string;
 // DtForeignKeyQty:TADODataSet;
  DtForeignKeyFieldQty:TADODataSet;
begin   {该过程允许在同一数据窗口不同的数据集上调用多次（比如主从表结构的数据窗口），
        同一张被检查的表会创建名为 TableName+'DtForeignKeyFieldQty'的数据集，允许被多次使用，不用反复打开表，从而提高效率。 }
  if f.FindComponent(TableName+'DtForeignKeyFieldQty')=nil then   //如果数据集不存在就创建。
  begin
    DtForeignKeyFieldQty:=TADODataSet.Create(f);
    DtForeignKeyFieldQty.LockType:=ltReadOnly;
    DtForeignKeyFieldQty.Name:= TableName+'DtForeignKeyFieldQty' ;
    DtForeignKeyFieldQty.Connection:=DM.ADOConnection1;
    DtForeignKeyFieldQty.CommandText:= 'select co.ConstID ,o.name as FTableName, c.name as FFieldName,o1.name as RTableName,c1.name as RFieldName'
                                   +' from sysforeignkeys f join sysconstraints co on f.constid=co.constid'
                                   +' join dbo.syscolumns c on f.fkeyid=c.id and f.fkey=c.colid '
                                   +' join dbo.sysObjects  o on  c.id =o.id and o.id =co.id '
                                   +' join dbo.syscolumns c1 on f.rkeyid=c1.id and f.rkey=c1.colid'
                                   +' join dbo.sysObjects  o1 on  c1.id =o1.id '
                                   +' where o1.name= '+QuotedStr(TableName)
                                   +' order by f.constid, rkey';

    DtForeignKeyFieldQty.Open;
  end ;
  SQL:=''; //初始化值。
  Msg:='';
  ConstID:='';
  FTableName:='' ;

  with f.FindComponent(TableName+'DtForeignKeyFieldQty')as TADODataSet do
  begin
    if  IsEmpty then Exit;//如果记录为零，退出
    First;
    ConstID:= FieldByName('ConstID').AsString ;
      FTableName:=FieldByName('FTableName').AsString;
      SQL:=SQL+AddSql(SQL)+ FieldByName('FFieldName').Value+' = '
           +QuotedStr(Dt.FieldByName(FieldByName('RFieldName').asstring).Value); //被修改的数据

      Msg:=Msg+ '字段：“'+Dt.FieldByName(FieldByName('RFieldName').asString).DisplayLabel+'”的值'
           + '“'+ Dt.FieldByName(FieldByName('RFieldName').asString).asString +'”，'+#10#13 ;
      Next;
    for I:=0 to RecordCount-1 do// while not (Eof )do//该循环要多执行一次，所以不能用RecordCount-1
    begin
      if ConstID<>'' then
      if (ConstID<> FieldByName('ConstID').AsString )or(Eof) then
      begin
        if  PrimKeyExists('select * from '+FTableName+#10#13+SQL) then   //  PrimKeyExists()是自定义FUNCTION，如果记录存在，返回真，否则返回假
        begin
          Myerror(Msg+'已经被“'+SQLResultValue('select FormCaptionCN from ussysTableName where tableName='
            +QuotedStr(FTableName))
            +'”('+FTableName+')子表引用，现不允许删除！');   //
          Dt.Cancel;
          Abort;        //结束当前用户的操作。
        end;
        SQL:=''; //初始化值。
        Msg:='';
        //ConstID:= FieldByName('ConstID').AsString ;
      end;
      ConstID:= FieldByName('ConstID').AsString ;
      FTableName:=FieldByName('FTableName').AsString;
      SQL:=SQL+AddSql(SQL)+ FieldByName('FFieldName').Value+' = '
           +QuotedStr(Dt.FieldByName(FieldByName('RFieldName').Value).Value); //被修改的数据

      Msg:=Msg+ '字段：“'+Dt.FieldByName(FieldByName('RFieldName').asString).DisplayLabel+'”的值'
           + '“'+ Dt.FieldByName(FieldByName('RFieldName').asString).asString +'”，'+#10#13 ;
      Next;
    end ;
  end;
end;

procedure EditForeignKeyCheck(TableName:string;Dt:TADODataSet;F:TForm);
var
  i:Integer;
  IsEdit: Boolean;
  SQL,Msg,ConstID,FTableName:string;
//  DtForeignKeyQty:TADODataSet;
  DtForeignKeyFieldQty:TADODataSet;
begin   {该过程允许在同一数据窗口不同的数据集上调用多次（比如主从表结构的数据窗口），
        同一张被检查的表会创建名为 TableName+'DtForeignKeyFieldQty'的数据集，允许被多次使用，不用反复打开表，从而提高效率。 }
  if Dt.State<>dsEdit then
  Exit;      //如果当前数据集的状态不是编辑，退出

  if f.FindComponent(TableName+'DtForeignKeyFieldQty')=nil then   //如果数据集不存在就创建。
  begin
    DtForeignKeyFieldQty:=TADODataSet.Create(f);
    DtForeignKeyFieldQty.LockType:=ltReadOnly;
    DtForeignKeyFieldQty.Name:= TableName+'DtForeignKeyFieldQty' ;
    DtForeignKeyFieldQty.Connection:=DM.ADOConnection1;
    DtForeignKeyFieldQty.CommandText:= 'select co.ConstID ,o.name as FTableName, c.name as FFieldName,o1.name as RTableName,c1.name as RFieldName'
                                   +' from sysforeignkeys f join sysconstraints co on f.constid=co.constid'
                                   +' join dbo.syscolumns c on f.fkeyid=c.id and f.fkey=c.colid '
                                   +' join dbo.sysObjects  o on  c.id =o.id and o.id =co.id '
                                   +' join dbo.syscolumns c1 on f.rkeyid=c1.id and f.rkey=c1.colid'
                                   +' join dbo.sysObjects  o1 on  c1.id =o1.id '
                                   +' where o1.name= '+QuotedStr(TableName)
                                   +' order by f.constid, rkey';

    DtForeignKeyFieldQty.Open;
  end ;
  SQL:=''; //初始化值。
  Msg:='';
  ConstID:='';
  FTableName:='' ;
  IsEdit:=False;

  with f.FindComponent(TableName+'DtForeignKeyFieldQty')as TADODataSet do
  begin
    if  IsEmpty then Exit;//如果记录为零，退出
    First;

      ConstID:= FieldByName('ConstID').AsString ;
      FTableName:=  FieldByName('FTableName').AsString ;

      SQL:=SQL+AddSql(SQL)+ FieldByName('FFieldName').Value+' = '
           +QuotedStr(Trim(Dt.FieldByName(FieldByName('RFieldName').Value).OldValue)); //被修改的数据
      if Trim(Dt.FieldByName(FieldByName('RFieldName').Value).OldValue)<>
        Trim(Dt.FieldByName(FieldByName('RFieldName').Value).NewValue)  then
        IsEdit:=True;

      Msg:=Msg+ '字段：“'+Dt.FieldByName(FieldByName('RFieldName').asString).DisplayLabel+'”的值'
           + '“'+ (string(Dt.FieldByName(FieldByName('RFieldName').asString).OldValue)) +'”，'+#10#13 ;
      Next;

    for I:=0 to RecordCount-1 do// while not (Eof )do//该循环要多执行一次，所以不能用RecordCount-1
    begin

      if ConstID<>'' then
      if (ConstID<> FieldByName('ConstID').AsString )or(Eof) then
      begin
        if  IsEdit then
        begin
     //   ShowMessage('select * from '+FTableName+#10#13+SQL);
        if  PrimKeyExists('select * from '+FTableName+#10#13+SQL) then   //  PrimKeyExists()是自定义FUNCTION，如果记录存在，返回真，否则返回假
        begin

          Myerror(Msg+'已经被“'+SQLResultValue('select FormCaptionCN from ussysTableName where tableName='
            +QuotedStr(FTableName))
            +'”('+FTableName+')子表引用，现不允许修改！');   //在DATA表上，不存在字段名为“”的记录。
         // Dt.Cancel;
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
      FTableName:=  FieldByName('FTableName').AsString ;

      SQL:=SQL+AddSql(SQL)+ FieldByName('FFieldName').Value+' = '
           +QuotedStr(Trim(Dt.FieldByName(FieldByName('RFieldName').Value).OldValue)); //被修改的数据
      if Trim(Dt.FieldByName(FieldByName('RFieldName').Value).OldValue)<>
        Trim(Dt.FieldByName(FieldByName('RFieldName').Value).NewValue)  then
        IsEdit:=True;

      Msg:=Msg+ '字段：“'+Dt.FieldByName(FieldByName('RFieldName').asString).DisplayLabel+'”的值'
           + '“'+ Trim(string(Dt.FieldByName(FieldByName('RFieldName').asString).OldValue)) +'”，'+#10#13 ;
      Next;
      end;
    end ;
  end;
{ // DtForeignKeyQty:=TADODataSet.Create(f);   以下部分是完整代码，但发现效率低，改用以上代码。
 // DtForeignKeyQty.Connection:=DM.ADOConnection1;
  DtForeignKeyFieldQty:=TADODataSet.Create(f);
  DtForeignKeyFieldQty.Connection:=DM.ADOConnection1;

  DtForeignKeyQty.CommandText:='select * from sysforeignkeys f where exists '
                               +'(select * from sysObjects o where o.id=f.rkeyid and name= '
                               +QuotedStr(TableName)+')';
  DtForeignKeyQty.Open;    //打开有多少表参照引用当前表

  while not  DtForeignKeyQty.eof do
  begin
    SQL:=''; //初始化值。
    Msg:='';
    DtForeignKeyFieldQty.Close;
      DtForeignKeyFieldQty.CommandText:= 'select co.ConstID ,o.name as FTableName, c.name as FFieldName,o1.name as RTableName,c1.name as RFieldName'
                                   +' from sysforeignkeys f join sysconstraints co on f.constid=co.constid'
                                   +' join dbo.syscolumns c on f.fkeyid=c.id and f.fkey=c.colid '
                                   +' join dbo.sysObjects  o on  c.id =o.id and o.id =co.id '
                                   +' join dbo.syscolumns c1 on f.rkeyid=c1.id and f.rkey=c1.colid'
                                   +' join dbo.sysObjects  o1 on  c1.id =o1.id '
                                   +' where o1.name= '+QuotedStr(TableName) +' and co.constid ='+QuotedStr(DtForeignKeyQty.FieldByName('constid').Value)
                                   +' order by f.constid, rkey';
                                   ShowMessage(DtForeignKeyFieldQty.CommandText);

    DtForeignKeyFieldQty.Open;
    while (not DtForeignKeyFieldQty.Eof)   do
    begin


      SQL:=SQL+AddSql(SQL)+ DtForeignKeyFieldQty.FieldByName('FFieldName').Value+' = '
           +QuotedStr(Dt.FieldByName(DtForeignKeyFieldQty.FieldByName('RFieldName').Value).OldValue); //被修改的数据

      if Msg<>'' then
      Msg:=Msg+#10#13;
      Msg:=Msg+ '“'+Dt.FieldByName(DtForeignKeyFieldQty.FieldByName('FFieldName').asString).DisplayLabel+'”的值'
           + '“'+ Dt.FieldByName(DtForeignKeyFieldQty.FieldByName('RFieldName').asString).OldValue +'”' ;
      DtForeignKeyFieldQty.Next;
    end;

    if SQL<>'' then
    begin
    SQL:='select * from '+DtForeignKeyFieldQty.FieldByName('FTableName').Value+#10#13+SQL;
    ShowMessage(SQL);
    if  PrimKeyExists(SQL) then   //  PrimKeyExists()是自定义FUNCTION，如果记录存在，返回真，否则返回假
    begin
      Myerror('字段'+Msg+'，已经被“'+SQLResultValue('select FormCaptionCN from ussysTableName where tableName='
        +QuotedStr(DtForeignKeyFieldQty.FieldByName('FTableName').AsString))
        +'”('+DtForeignKeyFieldQty.FieldByName('FTableName').AsString+')表引用，现不允许修改！');   //在DATA表上，不存在字段名为“”的记录。
      Dt.Cancel;
      Abort;        //结束当前用户的操作。
    end;
    end;
    DtForeignKeyQty.Next;
  end;     }
end;

procedure ReferenceCheck(TableName:string;Dt:TADODataSet;F:TForm);
var
  i:Integer;
  SQL,Msg,RTableName,FFieldName,ConstID:string;
 // DtReferenceQty:TADODataSet;
  DtReferenceFieldQty:TADODataSet;
  IsEdit:Boolean;
begin
  if f.FindComponent(TableName+'DtReferenceFieldQty')=nil then   //如果数据集不存在就创建。
  begin
    DtReferenceFieldQty:=TADODataSet.Create(f);
    DtReferenceFieldQty.LockType:=ltReadOnly;
    DtReferenceFieldQty.Name:= TableName+'DtReferenceFieldQty' ;
    DtReferenceFieldQty.Connection:=DM.ADOConnection1;
    DtReferenceFieldQty.CommandText:= 'select co.ConstID ,o.name as FTableName, c.name as FFieldName,o1.name as RTableName,c1.name as RFieldName'
                                   +' from sysforeignkeys f join sysconstraints co on f.constid=co.constid'
                                   +' join dbo.syscolumns c on f.fkeyid=c.id and f.fkey=c.colid '
                                   +' join dbo.sysObjects  o on  c.id =o.id and o.id =co.id '
                                   +' join dbo.syscolumns c1 on f.rkeyid=c1.id and f.rkey=c1.colid'
                                   +' join dbo.sysObjects  o1 on  c1.id =o1.id '
                                   +' where o.name= '+QuotedStr(TableName)
                                   +' order by f.constid, rkey';

    DtReferenceFieldQty.Open;
  end ;

  SQL:=''; //初始化值。
  Msg:='';
  ConstID:='';
  RTableName:='' ;
  IsEdit:=False;
  FFieldName:='';
  with (f.FindComponent(TableName+'DtReferenceFieldQty')as TADODataSet) do
  begin
    if  IsEmpty then Exit;//如果记录为零，退出
    First;

        ConstID:= FieldByName('ConstID').AsString ;
        RTableName:=  FieldByName('RTableName').AsString ;
        FFieldName:=  FieldByName('FFieldName').AsString ;
        if Dt.State=dsEdit then
          if Dt.FieldByName(FieldByName('FFieldName').AsString).OldValue<>
            Dt.FieldByName(FieldByName('FFieldName').AsString).NewValue then
            IsEdit:=True;
         SQL:=SQL+AddSql(SQL)+ FieldByName('RFieldName').Value+' = '
             +QuotedStr(Trim(Dt.FieldByName(FieldByName('FFieldName').AsString).AsString));

        Msg:=Msg+ '字段：“'+Dt.FieldByName(FieldByName('FFieldName').asString).DisplayLabel+'”的值'
            + '“'+ Trim(Dt.FieldByName(FieldByName('FFieldName').asString).AsString) +'”，'+#10#13 ;
      Next;

    for I:=0 to RecordCount-1 do//while not (Eof )do   //该循环要多执行一次，所以不能用RecordCount-1
    begin
      if FFieldName<>''then
      begin
        if  not (Dt.FieldByName(FFieldName).IsNull )then //如果当前数据集的参照字段的值不是NULL
        if ConstID<>'' then
        if (ConstID<> FieldByName('ConstID').AsString)or (Eof)  then  //如果当前记录的约束号不等于上一行的记录号或者已是最后一行记录，执行下面查询
        begin
        if (Dt.State=dsInsert )or(IsEdit=True)then
          begin
           //ShowMessage('1 select * from '+RTableName+#10#13+SQL);
          if not PrimKeyExists('select * from '+RTableName+#10#13+SQL) then   //  PrimKeyExists()是自定义FUNCTION，如果记录存在，返回真，否则返回假
            begin
            Myerror(Msg+'在“'
            +SQLResultValue('select FormCaptionCN from ussysTableName where tableName='+QuotedStr(RTableName) )
             +'”('+RTableName+')父表中不存在，不允许保存！') ;  //在DATA表上，不存在字段名为“”的记录。
            Abort;        //结束当前用户的操作。
            end;
          end;
        end;
          SQL:=''; //重置为空。
          Msg:='';
          IsEdit:=false;
          FFieldName:='';
          ConstID:='';
      end ;
      if not Eof then
      begin
        ConstID:= FieldByName('ConstID').AsString ;
        RTableName:=  FieldByName('RTableName').AsString ;
        FFieldName:=  FieldByName('FFieldName').AsString ;
        if Dt.State=dsEdit then
          if Dt.FieldByName(FieldByName('FFieldName').AsString).OldValue<>
            Dt.FieldByName(FieldByName('FFieldName').AsString).NewValue then
            IsEdit:=True;
         SQL:=SQL+AddSql(SQL)+ FieldByName('RFieldName').Value+' = '
             +QuotedStr(Trim(Dt.FieldByName(FieldByName('FFieldName').AsString).AsString));

        Msg:=Msg+ '字段：“'+Dt.FieldByName(FieldByName('FFieldName').asString).DisplayLabel+'”的值'
            + '“'+ Trim(Dt.FieldByName(FieldByName('FFieldName').asString).AsString) +'”，'+#10#13 ;
      Next;
      end;
    end ;
  end;

 { DtReferenceQty:=TADODataSet.Create(nil);      //  以下部分是完整代码，但发现效率低，改用以上代码。
  DtReferenceFieldQty:=TADODataSet.Create(nil);
  DtReferenceQty.Connection:=DM.ADOConnection1;
  DtReferenceFieldQty.Connection:=DM.ADOConnection1;

   DtReferenceQty.CommandText:='select * from  sysconstraints co  where exists '
                              +'(select * from sysObjects o where o.id=co.id and o.name='
                              +QuotedStr(TableName)+')';
  DtReferenceQty.Open;

  while not  DtReferenceQty.eof do
  begin
    SQL:='';
    Msg:='';
    DtReferenceFieldQty.Close;
      DtReferenceFieldQty.CommandText:= 'select co.ConstID ,o.name as FTableName, c.name as FFieldName,o1.name as RTableName,c1.name as RFieldName'
                                   +' from sysforeignkeys f join sysconstraints co on f.constid=co.constid'
                                   +' join dbo.syscolumns c on f.fkeyid=c.id and f.fkey=c.colid '
                                   +' join dbo.sysObjects  o on  c.id =o.id and o.id =co.id '
                                   +' join dbo.syscolumns c1 on f.rkeyid=c1.id and f.rkey=c1.colid'
                                   +' join dbo.sysObjects  o1 on  c1.id =o1.id '
                                   +' where o.name= '+QuotedStr(TableName) +' and co.constid ='+QuotedStr(DtReferenceQty.FieldByName('constid').Value)
                                   +' order by f.constid, rkey';
                                  // ShowMessage(DtReferenceFieldQty.CommandText);

      DtReferenceFieldQty.Open;
    while (not DtReferenceFieldQty.Eof)   do
    begin


      SQL:=SQL+AddSql(SQL)+ DtReferenceFieldQty.FieldByName('RFieldName').Value+' = '
           +QuotedStr(Dt.FieldByName(DtReferenceFieldQty.FieldByName('FFieldName').Value).Value);
      //showmessage(sql);
      if Msg<>'' then
      Msg:=Msg+#10#13+'      ';
      Msg:=Msg+ '“'+Dt.FieldByName(DtReferenceFieldQty.FieldByName('FFieldName').asString).DisplayLabel+'”的值'
           + '“'+ Dt.FieldByName(DtReferenceFieldQty.FieldByName('FFieldName').asString).asString +'”' ;
      DtReferenceFieldQty.Next;
    end;

    if SQL<>'' then
    begin
    SQL:='select * from '+DtReferenceFieldQty.FieldByName('RTableName').Value+#10#13+SQL;
    if not PrimKeyExists(SQL) then   //  PrimKeyExists()是自定义FUNCTION，如果记录存在，返回真，否则返回假
    begin
      Myerror('字段：'+Msg+'，'+#10#13+'在“'+SQLResultValue('select FormCaptionCN from ussysTableName where tableName='
        +QuotedStr(DtReferenceFieldQty.FieldByName('RTableName').AsString))
        +'”('+DtReferenceFieldQty.FieldByName('RTableName').AsString+')父表中不存在，不允许保存！');   //在DATA表上，不存在字段名为“”的记录。
      Abort;        //结束当前用户的操作。
    end;
    end;
    DtReferenceQty.Next;
  end;  }
end;

procedure PrimaryCheck(TableName:string;dt:TADODataSet;F:TForm);
var
  i:Integer;
  SQL,Msg,SQLIndexName:string;
  IsEdit:Boolean;
  DtIndexsQty:TADODataSet;
begin
 if f.FindComponent(TableName+'DtIndexsQty')=nil then   //如果数据集不存在就创建。
  begin
    DtIndexsQty:=TADODataSet.Create(f);
    DtIndexsQty.LockType:=ltReadOnly;
    DtIndexsQty.Name:= TableName+'DtIndexsQty' ;
    DtIndexsQty.Connection:=DM.ADOConnection1;
    DtIndexsQty.CommandText:='select o.name as TableName,e.name as IndexName,C.name as FieldName ,e.* from dbo.syscolumns c '
                             +' join dbo.sysObjects  o on  c.id =o.id join sysindexkeys i on c.id=i.id and c.colid=i.colid '
                             +' join sysindexes e on e.id= i.id and e.indid=i.indid where o.name='
                             +QuotedStr(TableName)+' and e.status<>0 and colstat<>1 order by o.name ';
    DtIndexsQty.Open;  //  查询主键和唯一键有多少个字段。   colstat<>1不是自动增长列
   // ShowMessage(IntToStr(DtIndexsQty.RecordCount));
  end ;
  SQL:=''; //初始化值。
  Msg:='';
  SQLIndexName:='';
  IsEdit:=False;


  with f.FindComponent(TableName+'DtIndexsQty')as TADODataSet do
  begin
    if  IsEmpty then Exit;//如果记录为零，退出
    First;
      SQLIndexName:= FieldByName('IndexName').AsString ;
      if dt.State=dsEdit then                       //如果是当前数据集的状态是修改
        begin
          if  Dt.FieldByName(FieldByName('FieldName').asString).DataType=ftString then    //如果是字符类型 ，将新旧值转换为大写后比较是否相同
            begin
            if UpperCase(Dt.FieldByName(FieldByName('FieldName').asString).NewValue)<>
              UpperCase(Dt.FieldByName(FieldByName('FieldName').asString).OldValue) then
              IsEdit:=True;
            end
            else      //否则如果不是字符类型
            begin
            if Dt.FieldByName(FieldByName('FieldName').asString).NewValue<>
              Dt.FieldByName(FieldByName('FieldName').asString).OldValue then
              IsEdit:=True;                             //如果新值不等于旧值，设当前字段已修改是真。
            end;
        end;
         // showmessage(FieldByName('FieldName').asString);
        //  showmessage(Dt.FieldByName(FieldByName('FieldName').asString).Value);
      if  not Dt.FieldByName(FieldByName('FieldName').asString).IsNull then
        begin
        SQL:=SQL+AddSql(SQL)+ FieldByName('FieldName').asString+' = '
           +QuotedStr(Dt.FieldByName(FieldByName('FieldName').asString).Value);

        Msg:=Msg+ '字段：“'+Dt.FieldByName(FieldByName('FieldName').asString).DisplayLabel+'”的值'
           + '“'+ Trim(Dt.FieldByName(FieldByName('FieldName').asString).asString) +'”，' +#10#13;
        end;
      Next;

    for I:=1 to RecordCount do
    begin
      if SQLIndexName<>'' then
      if (SQLIndexName<> FieldByName('IndexName').AsString )or(Eof) then //如果上一行的索引名和当前索引名不同或者是最后一行。
      begin
        if (Dt.State=dsInsert )or(IsEdit=True)then
        begin
        //ShowMessage('select * from '+TableName+#10#13+SQL);
        if  PrimKeyExists('select * from '+TableName+#10#13+SQL) then   //  PrimKeyExists()是自定义FUNCTION，如果记录存在，返回真，否则返回假
        begin
          myerror(Msg+'该记录已经存在，不允许重复！');
          Abort;        //结束当前用户的操作。
        end;

       // SQLIndexName:= FieldByName('IndexName').AsString ;
        end;
        SQL:=''; //初始化值。
        Msg:='';
        IsEdit:=False;
      end  ;
      if not eof then
      begin
      SQLIndexName:= FieldByName('IndexName').AsString ;
      if dt.State=dsEdit then                  //如果是当前数据集的状态是修改
          if  Dt.FieldByName(FieldByName('FieldName').asString).DataType=ftString then    //如果是字符类型 ，将新旧值转换为大写后比较是否相同
            begin
            if UpperCase(Dt.FieldByName(FieldByName('FieldName').asString).NewValue)<>
              UpperCase(Dt.FieldByName(FieldByName('FieldName').asString).OldValue) then
              IsEdit:=True;
            end
            else      //否则如果不是字符类型
            begin
            if Dt.FieldByName(FieldByName('FieldName').asString).NewValue<>
              Dt.FieldByName(FieldByName('FieldName').asString).OldValue then
              IsEdit:=True;                             //如果新值不等于旧值，设当前字段已修改是真。
            end;
      {  if Dt.FieldByName(FieldByName('FieldName').asString).NewValue<>
           Dt.FieldByName(FieldByName('FieldName').asString).OldValue then
          IsEdit:=True;                        //如果新值不等于旧值，设当前字段已修改是真。  }
        //  showmessage(FieldByName('FieldName').asString);
       //   showmessage(Dt.FieldByName(FieldByName('FieldName').asString).Value);
      if  not Dt.FieldByName(FieldByName('FieldName').asString).IsNull then
        begin
        SQL:=SQL+AddSql(SQL)+ FieldByName('FieldName').asString+' = '
           +QuotedStr(Dt.FieldByName(FieldByName('FieldName').asString).Value);

        Msg:=Msg+ '字段：“'+Dt.FieldByName(FieldByName('FieldName').asString).DisplayLabel+'”的值'
           + '“'+ Trim(Dt.FieldByName(FieldByName('FieldName').asString).asString) +'”，' +#10#13;
        end;
      Next;
      end;
    end ;
  end;

{  DM.DtIndexsQty.Close;          //以下代码完整，但发现执行效率低，更换以上代码
  DM.DtIndexsQty.CommandText:='select i.* from sysindexes i join sysObjects o on i.id=o.id '
                              +'where o.name='+QuotedStr(TableName)+' and i.status not in(8388704,0,2097152)';
  DM.DtIndexsQty.Open; //查询该表有多少主键和唯一的索引
  while not  DM.DtIndexsQty.eof do
  begin
    DM.DtPrimaryCheck.Close;
    DM.DtPrimaryCheck.CommandText:='select o.name as TableName,e.name as IndexName,C.name as FieldName ,e.* from dbo.syscolumns c '
                                 +' join dbo.sysObjects  o on  c.id =o.id join sysindexkeys i on c.id=i.id and c.colid=i.colid '
                                 +' join sysindexes e on e.id= i.id and e.indid=i.indid where e.status<>0 and e.name= '
                                 +QuotedStr(DM.DtIndexsQty.FieldByName('Name').AsString);
    DM.DtPrimaryCheck.Open;  //  查询主键和唯一有多少个字段。

    IsEdit:=False;//初始化值。
    SQL:='';
    Msg:='';
    while (not DM.DtPrimaryCheck.Eof)   do
    begin
    if dt.State=dsEdit then    //如果是当前数据集的状态是修改
      if Dt.FieldByName(DM.DtPrimaryCheck.FieldByName('FieldName').asString).NewValue<>  Dt.FieldByName(DM.DtPrimaryCheck.FieldByName('FieldName').asString).OldValue then
        IsEdit:=True;       //如果新值不等于旧值，设已修改是真。
                            //AddSql()是自定义FUNCTION，如果SQL是空，返回 WHERE ，否则返回 AND
      SQL:=SQL+AddSql(SQL)+ DM.DtPrimaryCheck.FieldByName('FieldName').asString+' = '
           +QuotedStr(Dt.FieldByName(DM.DtPrimaryCheck.FieldByName('FieldName').asString).Value);
          // ShowMessage('Where:'+SQL);
      if Msg<>'' then
      Msg:=Msg+#10#13+'      ';
      Msg:=Msg+ '“'+Dt.FieldByName(DM.DtPrimaryCheck.FieldByName('FieldName').asString).DisplayLabel+'”的值'
           + '“'+ Dt.FieldByName(DM.DtPrimaryCheck.FieldByName('FieldName').asString).asString +'”' ;
      DM.DtPrimaryCheck.Next;
    end;

    DM.DtIndexsQty.Next;

    if dt.State=dsEdit then    //如果是当前数据集的状态是修改
      if IsEdit=false then  Break;               //如果已修改是假，退出当前循环。不需要执行下列的主键存在检查。

    SQL:='select * from '+TableName+#10#13+SQL;
   // ShowMessage('SQL:'+SQL);
    if  PrimKeyExists(SQL) then   //  PrimKeyExists()是自定义FUNCTION，如果记录存在，返回真，否则返回假
    begin
      myerror('字段：'+Msg+'已经存在，不允许重复！');
      Abort;        //结束当前用户的操作。
    end;
    
  end;  }
end;

procedure AddDateCalculatedField(Dgh:TDBGridEh;CalculateFieldName,DisplayLabel,PriorFieldName:string);
var
a:TDateTimeField;
colt:TColumnEh;
begin
  Dgh.DataSource.DataSet.close;
  a:=TDateTimeField.create(Dgh.DataSource.DataSet);
  a.FieldKind:=fkCalculated;
  a.FieldName:=CalculateFieldName;
  a.DisplayLabel:=DisplayLabel;
  a.DataSet:=Dgh.DataSource.DataSet;

  Dgh.DataSource.DataSet.Open;

  colt:=Dgh.Columns.Add;
  colt.FieldName:= CalculateFieldName;
  colt.Index:=Dgh.FieldColumns[PriorFieldName].Index+1;
end;
 {
procedure DghLoadFields(F:TForm;ProgName:string;EMPLOYEE_PTR:string);
var
  DtCompCount:TADODataSet;
  //DtFieldSet :TADOStoredProc;
 // colt:TColumnEh;
  i,j:Integer;
  CompName:string;

begin          }
   // showmessage(TDBGrideh(F.ActiveControl).Name );
     { DtFieldSet.CommandText:='select s.ProgName,s.CompName,s.UseTableName ,s.FieldName,f.FieldNameCN,isnull(s.FieldOrder,f.FieldOrder)as FieldOrder,isnull(s.GridWidth,f.GridWidth)as GridWidth,'
                              +'isnull(s.GridVisi,f.GridVisi)as GridVisi,isnull(s.TitleButton,f.TitleButton)as TitleButton,isnull(s.ReadOnly,f.ReadOnly)as ReadOnly '
                              +'from sysobjects o join  dbo.syscolumns c on o.id=c.id join usSYSFieldName f on f.TableName=o.name and f.FieldName=c.name '
                              +'join usSysFieldSet s on f.FieldName=s.FieldName and f.TableName=s.UseTableName where ProgName= '+QuotedStr(ProgName)
                              +' and sys =0 and CompName= '+QuotedStr(TDBGrideh(F.ActiveControl).Name )
                              +' order by s.CompName,s.FieldOrder '; }
     // DtFieldSet.Open;    //打开系统字段和用户自定义字段名称表。

    {  DtCompCount:=TADODataSet.Create(nil);
      DtCompCount.Connection:=DM.ADOConnection1;
      DtCompCount.LockType:=ltReadOnly;
      DtCompCount.Close;
      DtCompCount.CommandText:='select distinct CompName from dbo.usSysFieldSet where ProgName='+QuotedStr(ProgName);
      DtCompCount.Open;  }
 { for j:=0 to f.ComponentCount-1 do
    begin
    if f.Components[j] is TDBGridEh then
      //while not (DtCompCount.Eof) do
      begin
      DM.spDtFieldSet.Close;
      DM.spDtFieldSet.Parameters.ParamByName('@ProgName').DataType:=ftString;
      DM.spDtFieldSet.Parameters.ParamByName('@ProgName').Value:= ProgName ;
      DM.spDtFieldSet.Parameters.ParamByName('@CompName').DataType:=ftString;
      DM.spDtFieldSet.Parameters.ParamByName('@CompName').Value:= (f.Components[j] AS TDBGridEh).Name;//DtCompCount.FieldByName('CompName').AsString;
      DM.spDtFieldSet.Parameters.ParamByName('@EMPLOYEE_PTR').DataType:=ftInteger;
      DM.spDtFieldSet.Parameters.ParamByName('@EMPLOYEE_PTR').Value:=StrToInt(EMPLOYEE_PTR);
      DM.spDtFieldSet.ExecProc;
      DM.spDtFieldSet.Open;
      i:=0 ;

      if F.FindComponent(DM.spDtFieldSet.FieldByName('CompName').AsString) is TDBGridEh then
        begin

        with  (F.FindComponent(DM.spDtFieldSet.FieldByName('CompName').AsString)as TDBGridEh)   do
          begin
          ShowHint:=True;
          Columns.Clear;   //清除已有的固定字段。
          DM.spDtFieldSet.First;
          while not (DM.spDtFieldSet.Eof) do
            begin
              //GRID控件动态添加字段。
              Columns.Add;
              Columns[i].FieldName:= DM.spDtFieldSet.FieldByName('FieldName').AsString;
              if not(DM.spDtFieldSet.FieldByName('GridWidth').IsNull) then
                     Columns[i].Width:= DM.spDtfieldSet.FieldByName('GridWidth').AsInteger;  //设置GRID控件的字段宽度
              if not(DM.spDtFieldSet.FieldByName('GridVisi').IsNull)then
              if DM.spDtFieldSet.FieldByName('GridVisi').AsBoolean=false then
                     Columns[i].Visible:=false;    //ifend     //设置GRID控件的字段不可见
              if DM.spDtFieldSet.FieldByName('TitleButton').AsBoolean=True then
                  begin
                     Columns[i].Title.TitleButton:=True;
                     Columns[i].Title.Hint:='支持单击排序'  ;
                  end;
              if DM.spDtFieldSet.FieldByName('ReadOnly').AsBoolean then
                     Columns[i].ReadOnly:=True;
              if DataSource.DataSet.FieldByName(DM.spDtFieldSet.FieldByName('FieldName').AsString).Required then
                  begin
                  Columns[i].Title.Font.Color:=clBlue;   //蓝色字体显示
                  if (Columns[i].Title.Hint)<>'' then  //如果提示字符串不是空，
                      Columns[i].Title.Hint:=  Columns[i].Title.Hint+#10#13+'字段不能为空'

                  else
                       Columns[i].Title.Hint:='字段不能为空'; //提示
                  end;
               i:=i+1;
              DM.spDtFieldSet.Next;
            end ;

          end;
        end;
      DtCompCount.Next;
      end;
     // DtCompCount.Close;
    end;
  DM.spDtFieldSet.Close;
end;     }

procedure DghLoadFields(F:TForm;TableName ,ProgName:string;Dt:TADODataSet;EMPLOYEE_PTR:string);
var
  i,j:Integer;
begin
  Dt.Open;
  for j:=0 to f.ComponentCount-1 do
  begin
  if f.Components[j] is TDBGridEh then
    with f.Components[j] as TDBGridEh do
    begin
      if DataSource.DataSet=Dt then
      begin
      DM.spDtFieldSet.Close;
     // DM.spDtFieldSet.Parameters.ParamByName('@TableName').DataType:=ftString;
      DM.spDtFieldSet.Parameters.ParamByName('@TableName').Value:=TableName ;
     // DM.spDtFieldSet.Parameters.ParamByName('@ProgName').DataType:=ftString;
      DM.spDtFieldSet.Parameters.ParamByName('@ProgName').Value:= ProgName ;
   //   DM.spDtFieldSet.Parameters.ParamByName('@CompName').DataType:=ftString;
      DM.spDtFieldSet.Parameters.ParamByName('@CompName').Value:= Name;
   //   DM.spDtFieldSet.Parameters.ParamByName('@EMPLOYEE_PTR').DataType:=ftInteger;
      DM.spDtFieldSet.Parameters.ParamByName('@EMPLOYEE_PTR').Value:=StrToInt(EMPLOYEE_PTR);
      DM.spDtFieldSet.ExecProc;
      DM.spDtFieldSet.Open;

      I:=0;
      if DM.spDtFieldSet.RecordCount>0 then
          begin
          ShowHint:=True;
          Columns.Clear;   //清除已有的固定字段。
          DM.spDtFieldSet.First;
          while not (DM.spDtFieldSet.Eof) do
            begin
             // if DM.spDtFieldSet.FieldByName('InGrid').AsBoolean=False then   Break;
              //GRID控件动态添加字段。
              Columns.Add;
              Columns[i].FieldName:= DM.spDtFieldSet.FieldByName('FieldName').AsString;
              Columns[i].Field.DisplayLabel:= DM.spDtFieldSet.FieldByName('FieldNameCN').AsString;
              if not(DM.spDtFieldSet.FieldByName('GridWidth').IsNull) then
                     Columns[i].Width:= DM.spDtfieldSet.FieldByName('GridWidth').AsInteger;  //设置GRID控件的字段宽度
              if not(DM.spDtFieldSet.FieldByName('GridVisi').IsNull)then
              if DM.spDtFieldSet.FieldByName('GridVisi').AsBoolean=false then
                     Columns[i].Visible:=false;    //ifend     //设置GRID控件的字段不可见
              if DM.spDtFieldSet.FieldByName('TitleButton').AsBoolean=True then
                  begin
                     Columns[i].Title.TitleButton:=True;
                     Columns[i].Title.Hint:='支持单击排序'  ;
                  end;
              if DM.spDtFieldSet.FieldByName('ReadOnly').AsBoolean then
                     Columns[i].ReadOnly:=True;
              if DataSource.DataSet.FieldByName(DM.spDtFieldSet.FieldByName('FieldName').AsString).Required then
                  begin
                  Columns[i].Title.Font.Color:=clBlue;   //蓝色字体显示
                  if (Columns[i].Title.Hint)<>'' then  //如果提示字符串不是空，
                      Columns[i].Title.Hint:=  Columns[i].Title.Hint+#10#13+'字段不能为空'

                  else
                       Columns[i].Title.Hint:='字段不能为空'; //提示
                  end;
               i:=i+1;
              DM.spDtFieldSet.Next;
            end ;
          end;
      end;
     // DtCompCount.Close;
    end;
  end;
  DM.spDtFieldSet.Close;
end;


procedure ColNotReadOnlyFocus(F:TForm;Ds:TDataSet);
var
  i:Integer;
begin
  for i:=0 to F.ComponentCount-1 do
    begin
      if (F.Components[i] is TDBGridEh) then
          if (F.Components[i] as TDBGridEh).DataSource.DataSet=Ds then
          begin
             DghReadOnlyFocus(F.Components[i] as TDBGridEh);
             Exit;
          end;
    end;
end;

procedure DghReadOnlyFocus(Sender :TDBGridEh);
var
  i:Integer;
begin
   for i:=0 to   (Sender as TDBGridEh).FieldCount-1   do
   begin
      if ((Sender as TDBGridEh).Columns[i].ReadOnly=false)and ((Sender as TDBGridEh).Columns[i].Visible=True ) then   //如果该字段的只读为假
          begin
             (Sender as TDBGridEh).SelectedIndex:=i;            //该字段获得焦点。
             Exit;
          end;
   end;
end;

Function  AuditCheck(LB:TLabel):bool;
begin
   if MidStr(LB.Caption,7,1)=IntToStr(0) then
     AuditCheck:=false
   else
     AuditCheck:=True;
end;

procedure NewNumb(Dt0004:TADODataSet);         //DT是打开Data0004表的数据集，而且过滤条件是当前打开的表。
var                       {1数据集保存成功后，调用该过程自动加1；}
i:Integer;
Num:Integer;
OldID:string;
NewID:string;
begin
//Dt.CommandText:='select * from data0004 where Table_name = '+ QuotedStr(TableName);
if Dt0004.RecordCount=1 then
  begin
  OldID:=Dt0004.FieldByName('SEED_VALUE').AsString  ;
  for i:=Length(OldID) downto 1 do
    begin
      if (Copy(OldID,i,1 )<'0')  or (Copy(OldID,i,1 )>'9')  then   //如果不是数字
         begin
         Num:=StrToInt(copy(OldID,i+1,Length(OldID)-i))+1;   //后缀数字加1

         NewID:= Copy(OldID,1,i);  //赋值前缀
         NewID:=NewID+copy(OldID,Length(NewID)+1,Length(OldID)-length(NewID)-Length(inttostr(Num)))+inttostr(Num);
         Dt0004.Edit;       //每调用一次，都会在旧编号的后面加上1
         Dt0004.FieldByName('SEED_VALUE').AsString:=NewID;
         Dt0004.Post;
         Exit;
         end
      else
      if I=1 then  //如果第一位仍然是数字
        begin

        Num:=StrToInt(copy(OldID,i+1,Length(OldID)-i))+1;
        NewID:= copy(OldID,1,Length(OldID)-Length(inttostr(Num)))+inttostr(Num) ;
      //  NewID:= IntToStr(StrToInt(OldID)+1);
        Dt0004.Edit;
        Dt0004.FieldByName('SEED_VALUE').AsString:=NewID;
        Dt0004.Post;
        end;
    end;

  end;
end;

procedure OperBefoCheck(Dgh:TDBGridEh;FieldName:string;FieldValue: array of Variant;msg:string;FieldNotValue:Boolean=False);
var                   //允许单选和多选。
  i,j:Integer;       //如果选择的行某字段的值，等于FieldValue的值，结束当前操作，并发出消息。
begin
 if Dgh.DataSource.DataSet.RecordCount>0 then
   if  Dgh.SelectedRows.Count > 1   then  //如果用户选择的行数大于1，即多行。
      begin
        with   Dgh.DataSource.DataSet   do
          for   i:=   Dgh.SelectedRows.Count  -  1   downto   0   do
            begin
               GotoBookmark(pointer(Dgh.SelectedRows.Items[i]));
               for j:=0 to High( FieldValue) do
                 begin
                    if  FieldNotValue=True then
                       begin
                       if UpperCase(FieldByName(FieldName).AsVariant)<> UpperCase(FieldValue[j]) then
                         begin
                           if j= High( FieldValue) then   //如果到数组的最后一行还没找到该值，
                           begin
                           myinfo(msg);
                           Abort;
                           end
                         end  ;
                       end
                    else
                       begin
                       if UpperCase(FieldByName(FieldName).AsVariant)<> UpperCase(FieldValue[j]) then
                         begin
                           if j= High( FieldValue) then   //如果到数组的最后一行还没找到该值，
                           begin
                           myinfo(msg);
                           Abort;
                           end
                         end  ;
                       end;

                 end;
            end;
      end
   else
   begin
      for j:=0 to High( FieldValue) do
         begin
           if UpperCase(Dgh.DataSource.DataSet.FieldByName(FieldName).AsVariant)<> UpperCase(FieldValue[j]) then
              begin
                myinfo(msg);
                Abort;
              end;
         end;
   end;
end;

procedure NotNull(Dgh:TDBGridEh;FieldsName:array of string);
var
  i:Integer;
begin
  for i:=0 to High( FieldsName) do
  begin
    if (Dgh.FieldColumns[FieldsName[i]].Field.IsNull)
        or(Dgh.FieldColumns[FieldsName[i]].Field.AsString='') then
     begin
       myerror(Dgh.FieldColumns[FieldsName[i]].Title.Caption+': 该字段不能为空！');
       Abort;
     end;
  end;
end;

procedure LoadColCaption(TableName:array of string;DgEh:TdbgridEH);
var
DTFieldOrder:TADODataSet;
i:integer;
TNS:string;
begin                  //功能：固定数据集动态添加中文字段名和其它属性。
if DgEh.DataSource.DataSet.Active=False then
   DgEh.DataSource.DataSet.Open;
   
  TNS:='Where O.name = '+quotedStr(TableName[0]);
  for i:=1 to High(TableName) do
  begin
    TNS:=TNS+' or  O.name = '+  quotedStr(TableName[i]) ;
  end;
      DTFieldOrder:=TADODataSet.Create(nil);
      DTFieldOrder.Connection:=DM.ADOConnection1;
      DTFieldOrder.Close;
      DTFieldOrder.CommandText:='select FieldNameCN,c.IsNullable,c.Name as FieldName,GridWidth,GridVisi,TitleButton,ReadOnly,FieldOrder from dbo.sysobjects o join dbo.syscolumns c on o.id=c.id '
      +'left outer join dbo.usSYSFieldName on c.name =FieldName and o.name=tablename '+TNS+' order by FieldOrder';
      DTFieldOrder.Open;    //打开系统字段和用户自定义字段名称表。
  DgEh.ShowHint:=True;
  for i:=0 to  DgEh.Columns.Count-1 do
      begin
         DTFieldOrder.First;
         while not DTFieldOrder.Eof do
           begin
           if UpperCase(DgEh.Fields[i].FieldName)= UpperCase(DTFieldOrder.FieldByName('FieldName').AsString)then
               begin
               DgEh.Columns[i].Title.Caption:=DTFieldOrder.FieldByName('FieldNameCn').AsString ;
               if not(DTFieldOrder.FieldByName('GridWidth').IsNull) then
                     DgEh.Columns[i].Width:= DTFieldOrder.FieldByName('GridWidth').AsInteger;  //设置GRID控件的字段宽度
               if not(DTFieldOrder.FieldByName('GridVisi').IsNull)then
               if DTFieldOrder.FieldByName('GridVisi').AsBoolean=false then
                     DgEh.Columns[i].Visible:=false;    //ifend     //设置GRID控件的字段不可见
               if DTFieldOrder.FieldByName('TitleButton').AsBoolean=True then
                  begin
                     DgEh.Columns[i].Title.TitleButton:=True;
                     DgEh.Columns[i].Title.Hint:='支持单击排序'  ;
                  end;
               if DTFieldOrder.FieldByName('ReadOnly').AsBoolean then
                     DgEh.Columns[i].ReadOnly:=True;
               if DTFieldOrder.FieldByName('IsNullable').AsInteger=0 then   //如果数据库的字段不能为空，就设字段不可为空的属性为真。
                  begin
                     DgEh.Fields[i].Required:=True;
                     DgEh.Columns[i].Title.Font.Color:=clBlue;   //不能为空字段的颜色为蓝色。
                     if (DgEh.Columns[i].Title.Hint)<>'' then  //如果提示字符串不是空，
                        DgEh.Columns[i].Title.Hint:= DgEh.Columns[i].Title.Hint+#10#13+'字段不能为空'
                     else
                        DgEh.Columns[i].Title.Hint:= '字段不能为空';
                  end;
               break;
               end;
           DTFieldOrder.Next;
           end    ;
      end;
          //既然是固定数据集，还是不要动态调整顺序了吧，
  { DTFieldOrder.First;         //重新调整GRID表格控制的显示顺序.
   J:=0;
   while not DTFieldOrder.Eof do
   begin
      for i:=0 to DgEh.Columns.Count-1  do
      begin
         if UpperCase(DgEh.Columns[i].FieldName)= UpperCase(DTFieldOrder.FieldByName('FieldName').AsString)then
            begin
                DgEh.Columns[i].Index:= J;
                J:=J+1;
                break;
            end;
      end;
   DTFieldOrder.Next;
   end;     }
      DTFieldOrder.Free;
end;

procedure DefaultValue(DataSet:TADODataSet;FieldsName:array of string;FieldValue:array of Variant)   ;
var
  i:Integer;
begin
    for i:=0 to High(FieldsName) do
    begin
       DataSet.FieldByName(FieldsName[i]).Value:=  FieldValue[i];
    end;
end;

procedure ClearSpace(Sender :TDBGridEh)   ;
begin{   用途：在 DBGridEh控件上，所有 AutoDropDown字段的值都会有空格
（原因是下拉列表项上用ColumnsAddList过程添加列表项时，在字段间用空格隔开），现将所有有自动下拉属性字段的空格清除。}
  if (Sender.DataSource.DataSet.State=dsInsert) or  (Sender.DataSource.DataSet.State=dsEdit) then
   if Sender.FieldColumns[Sender.SelectedField.FieldName].AutoDropDown then
    if  (not Sender.SelectedField.IsNull) and (Sender.SelectedField.AsString<>'' ) then
       begin
         Sender.DataSource.DataSet.FieldByName(Sender.SelectedField.FieldName).Value:=
         Trim(Sender.SelectedField.Value);  //清除空格的值。
       end;
end;

procedure PostFieldNotNull(DataSet: TDataSet;F:TForm);
var     //使用方法，在数据集的保存前调用。功能：数据集在保存前检查哪些字段不能为空，提示并中止保存数据集的操作。
  j,i:Integer;
begin
  for i:=0 to f.ComponentCount-1 do
  begin
     if f.Components[i] is TDBGridEh then
     begin
         if (f.Components[i] as  TDBGridEh).DataSource.DataSet=DataSet then
         begin
            for j:=0 to  (f.Components[i] as  TDBGridEh).FieldCount-1 do
            begin
               if (f.Components[i] as  TDBGridEh).Fields[j].Required then
               begin
                  if ((f.Components[i] as  TDBGridEh).Fields[j].IsNull)or
                        ((f.Components[i] as  TDBGridEh).Fields[j].AsString='')then
                  begin
                     myerror((f.Components[i] as  TDBGridEh).Columns[j].Title.Caption+': 该字段不能为空！');
   //                  (f.Components[i] as  TDBGridEh).Fields[j].;
                     Abort;
                  end;
               end;
            end;
         end;
     end;
  end;
 
 { for i:=0 to DataSet.FieldCount-1 do
  begin
    if DataSet.FieldList[i].Required then    //如果数据集的字段不能为空
    begin
        if (DataSet.FieldList[i].IsNull) or (Trim(DataSet.FieldList[i].AsString)='') then    //如果是空。
        begin
            myerror('“'+DataSet.FieldList[i].DisplayLabel+'”：该字段不能为空！');
            Abort;
        end;
    end;
  end;        }
end;

procedure ColExitUniqueCheck(KeyFieldName:string;TableName:string;Sender: TObject;SQLWhere:string='');
begin
  //
end;

procedure PostUniqueCheck(DataSet:TDataSet;TableName:string);
begin

end;

procedure ColExitForeKeyCheck(KeyFieldName:string;ForeignTableName:string;ForeKeyField:string;Sender: TObject;SQLWhere:string='');
var
SQL:string;
//I:Integer;
Dgh:TDBGridEh;

begin
Dgh:=sender as TDBGridEh;
if  (Dgh.SelectedField.isnull) then  Exit;
     if UpperCase(Dgh.SelectedField.FieldName)= UpperCase(KeyFieldName) then
     begin
     SQL:='select * from '+ForeignTableName+' where '+  ForeKeyField+' = '
     +QuotedStr(Dgh.SelectedField.AsString);
     ShowMessage(SQL);
     if SQLWhere<>'' then
     SQL:=SQL+SQLWhere;
     if  PrimKeyExists(Sql)=False then
     begin
     if  DM.DtUsSysTableName.Active =False then
     DM.DtUsSysTableName.Open;
     if DM.DtUsSysTableName.Lookup('TableName',ForeignTableName,'TableNameCN')='' then
     MyWarning(QuotedStr(Trim(Dgh.SelectedField.AsString))+'： 在相关表中不存在！')
     else
     MyWarning(QuotedStr(Trim(Dgh.SelectedField.AsString))+'： 在“'
     +DM.DtUsSysTableName.Lookup('TableName',ForeignTableName,'TableNameCN')+'”中不存在，'+#10#13+'请先在该表中添加！');
     //Abort;
     end ;   {
     if (Dgh.DataSource.DataSet.State=dsInsert )or (Dgh.DataSource.DataSet.State=dsEdit ) then //只有数据集在插入和编辑状态下，去掉空格。
     Dgh.DataSource.DataSet.FieldByName(KeyFieldName).Value:=  Trim(Dgh.SelectedField.AsString); //
     //数据集的字段名称DBGRIDEH的字段名完全相同。 }
     end
end;

procedure PostForeKeyExistsCheck(DataSet:TDataSet;TableName:string);
begin    {
if (DataSet.State=dsInsert )or (DataSet.State=dsEdit ) then //只有数据集在插入和编辑状态下才要检查
begin     //在相关表中主键是否存在，PrimKeyExists为自定义FUNCTION ，
    if  PrimKeyExists(Sql+QuotedStr(trim(DataSet.FieldByName(KeyFieldName).AsString)))=False then
     begin
       MyWarning(trim(DataSet.FieldByName(KeyFieldName).AsString)+'： 在相关表中不存在！');
       Abort;
     end ;
     if   Length(trim(DataSet.FieldByName(KeyFieldName).AsString))  <> Length(DataSet.FieldByName(KeyFieldName).AsString)  then
     begin
        DataSet.FieldByName(KeyFieldName).Value:=  trim(DataSet.FieldByName(KeyFieldName).AsString); // 清除空格
     //数据集的字段名称DBGRIDEH的字段名完全相同。
     end;     }
end;


procedure DghColExitNotNull(Sender: TDBGridEh);
begin   // 在DBGRIDEH控件的COLEXIT事件中使用，即当光标从当前单元格退出时，提示该字段不能为空
if Sender.DataSource.DataSet.FieldByName(Sender.SelectedField.FieldName).Required then//如果选择的字段不能为空。
  if (Sender.DataSource.DataSet.State=dsInsert )or (Sender.DataSource.DataSet.State=dsEdit ) then //如果数据集在插入和编辑状态下
    begin
    if (VarIsNull(Sender.SelectedField.Value ) )or (Trim(Sender.SelectedField.AsString)='')then  //如果该字段值为空
      begin
      MyERROR( Sender.FieldColumns[Sender.SelectedField.FieldName].Title.Caption+'： 该字段不能为空！');
      end;
    end;
end;

procedure FormCaption(TableName:string;T:TForm);
begin
    DM.DtUsSysTableName.Close;
    DM.DtUsSysTableName.CommandText:='select * from UsSysTableName where TableName = '+QuotedStr(TableName);
    DM.DtUsSysTableName.Open;
    if DM.DtUsSysTableName.RecordCount>0 then
       T.Caption:= DM.DtUsSysTableName.FieldByName('FormCaptionCN').AsString;
end;

procedure FormColReadOnly(F:TForm;Dt:TADODataSet;ColunmsName:array of string);
var
 j,i :Integer;
begin
  for j:=0 to f.ComponentCount-1 do
  begin
  if (f.Components[j] is TDBGridEh )then
    with (f.Components[j] as TDBGridEh ) do
    begin
      if UpperCase(DataSource.DataSet.Name)= UpperCase(Dt.Name) then
        begin
          for i:=0 to High(ColunmsName)do
          begin
            if FindFieldColumn(ColunmsName[i])<>nil then
              FieldColumns[ColunmsName[i]].ReadOnly:=True;
          end;
        end;
    end;
  end
end;

procedure ColReadOnly(DghName:TDBGridEH;ColunmsName:array of string);
var
  i :Integer;
begin
    for i:=0 to High(ColunmsName)do
    begin
      DghName.FieldColumns[ColunmsName[i]].ReadOnly:=True;
    end;
end;

procedure FormColNotVisi(F:TForm;Dt:TADODataSet;ColunmsName:array of string);
var
  j,i :Integer;
begin
  for j:=0 to f.ComponentCount-1 do
  begin
  if (f.Components[j] is TDBGridEh )then
    with (f.Components[j] as TDBGridEh ) do
    begin
      if UpperCase(DataSource.DataSet.Name)= UpperCase(Dt.Name) then
        begin
          for i:=0 to High(ColunmsName)do
          begin
            if FindFieldColumn(ColunmsName[i])<>nil then
              FieldColumns[ColunmsName[i]].Visible:=False;
          end;
        end;
    end;
  end
end;

procedure ColNotVisi(DghName:TDBGridEH;ColunmsName:array of string);
var
  i :Integer;
begin
    for i:=0 to High(ColunmsName)do
    begin
      DghName.FieldColumns[ColunmsName[i]].Visible:=False;
    end;
end;

procedure FormColumnAddList(F:TForm;DghColName:string;SQL: string);
var
  i:Integer;
begin
 dm.DtAddList.Close;
 dm.DtAddList.CommandText:=SQL;
 dm.DtAddList.LockType:= ltReadOnly;
 dm.DtAddList.Open;   //打开要添加的记录，

 for i:=0 to f.ComponentCount-1 do
 begin
   if (f.Components[i] is TDBGridEh) then
    if (f.Components[i] as TDBGridEh).FindFieldColumn(DghColName)<>nil then
    with (f.Components[i] as TDBGridEh).FieldColumns[DghColName] do
    begin
      if  dm.DtAddList.RecordCount>0 then
        begin
          dm.DtAddList.First;
          AutoDropDown:=True;  //列表框自动下拉
          while not  dm.DtAddList.Eof do
          begin
          PickList.Add( dm.DtAddList.Fields[0].AsString);
          dm.DtAddList.Next;
          end;
        end;
    end;
 end;
 dm.DtAddList.Close;
end;

procedure ColumnAddList(DghName:TDBGridEH;DghColName:string;SQL: string);
begin
 dm.DtAddList.Close;
 dm.DtAddList.CommandText:=SQL;
 dm.DtAddList.LockType:= ltReadOnly;
 dm.DtAddList.Open;   //打开要添加的记录，

 if  dm.DtAddList.RecordCount>0 then
     begin
     DghName.FieldColumns[DghColName].AutoDropDown:=True;  //列表框自动下拉
     while not  dm.DtAddList.Eof do
         begin
         DghName.FieldColumns[DghColName].PickList.Add( dm.DtAddList.Fields[0].AsString);
         dm.DtAddList.Next;
         end;
     end;
 dm.DtAddList.Close;
end;

Function  OutCheck(LB:TLabel):bool;
begin
   if MidStr(LB.Caption,9,1)=IntToStr(0) then
     OutCheck:=false
   else
     OutCheck:=True;
end;

Function  PrintCheck(LB:TLabel):bool;
begin
   if MidStr(LB.Caption,10,1)=IntToStr(0) then
     PrintCheck:=false
   else
     PrintCheck:=True;
end;

procedure BeforePostCheck(LB:TLabel);
begin
if MidStr(LB.Caption,6,1)=IntToStr(0) then
  begin
      myinfo('你没有数据的保存权限！');
      abort;
  end;
end;

procedure BeforeDeleteCheck(LB:TLabel);
begin
if MidStr(LB.Caption,5,1)=IntToStr(0) then
  begin
      myinfo('你没有数据的删除权限！');
      abort;
  end;
end;

procedure BeforeEditCheck(LB:TLabel);
begin
if MidStr(LB.Caption,4,1)=IntToStr(0) then
  begin
      myinfo('你没有数据的修改权限！');
      abort;
  end;
end;

procedure BeforeInsertCheck(LB:TLabel);
begin
if MidStr(LB.Caption,3,1)=IntToStr(0) then
  begin
      myinfo('你没有录入数据的权限！');
      abort;
  end;
end;

procedure FormAddLookFields(F:TForm;Dt:TADODataSet;DtLookName:string; TableName:array of string;KeyFields,LookupKeyFields:string;
           FieldName,LookupResultFields:array of string;FieldsDisplayLabel:array of string;SQL:string='';KeyFieldVisible:Boolean=True);
var                          {功能：如果LOOKUP数据集是从单表中获取数据，该过程可只指定一个表名的参数，SQL可为空。}
colt:TColumnEH;              {如果LOOKUP数据集是从多表中获取数据，该过程指定多个表名参数，SQL不可为空。}
t: TStringField;             {如果该数据集存在，如果该表没有打开，就重新打开。如果该数据集不存，就创建}
i,j:integer;
DtLookup,DtFieldName:TADODataSet;
TNS:string;
begin
  for i:=0 to F.ComponentCount-1 do
  begin
        if (F.Components[i] is TADODataSet) then
        begin
           if UpperCase((F.Components[i] as TADODataSet).Name)=UpperCase(DtLookName) then //如果这个数据集找到
             begin
             if  (F.Components[i] as TADODataSet).Active=False then     //如果这个数据集没有打开
                  begin
                  if SQL='' then                                        
                     (F.Components[i] as TADODataSet).CommandText:='select * from '+TableName[0]  //如果是多表，SQL一定不会为空。所以这个地方这样写不会错。
                  else
                     (F.Components[i] as TADODataSet).CommandText:=SQL ;
                  (F.Components[i] as TADODataSet).Open;                //数据集打开
                  end;
             DtLookup:=(F.Components[i] as TADODataSet);
             break;   //如果该数据集存在就结束该循环
             end ;
        end;

        if i= F.ComponentCount-1 then   //如果是最后一个组件
        begin
              DtLookup:=TADODataSet.Create(F);
              DtLookup.Name:=DtLookName;
              DtLookup.Connection:=DM.ADOConnection1;
              if SQL='' then
                 DtLookup.CommandText:='select * from '+TableName[0]
              else
                 DtLookup.CommandText:=SQL ;
              DtLookup.LockType:=ltReadOnly;
              DtLookup.Open;
        end;
  end;

  TNS:='';
  TNS:=' Where O.name = '+quotedStr(TableName[0]);
  for i:=1 to High(TableName) do
  begin
    TNS:=TNS+' or  O.name = '+  quotedStr(TableName[i]) ;
  end;

  DtFieldName:=TADODataSet.Create(nil);
  DtFieldName.Connection:=DM.ADOConnection1;
  DtFieldName.CommandText:='select isnull(u.FieldNameCN,c.name)as FieldNameCN,c.Name,c.xtype,c.length, isnull(u.GridWidth,100)as GridWidth '
                          +' from dbo.syscolumns c join dbo.sysObjects  o on  c.id =o.id  '
                          +' left join dbo.UsSysFieldName u on u.TableName=o.name and u.FieldName=c.name ' +TNS;
  DtFieldName.LockType:=ltReadOnly;
  DtFieldName.Open;

   Dt.Close;
      for I := High(FieldName) downto 0 do//用该种循环才能使下面GRID控件上显示的字段顺序符合需要。
      begin
          if Dt.Fields.FindField(FieldName[i])<>nil then      //如果该字段已经存在，退出。
              begin
                myerror('动态添加的查看字段名：“'+FieldName[i]+'”已存在！');
                Exit;
              end;
                          //下面代码动态生成查看（LOOKUP）字段。
          t := TStringField.Create(Dt);
          t.FieldKind := fkLookup;
          t.FieldName := FieldName[i];
          t.DisplayLabel:=DtFieldName.Lookup('name',LookupResultFields[i],'FieldNameCN');//DisplayLabel[i];
          if High(FieldsDisplayLabel)>=0  then
          begin
            t.DisplayLabel:=  FieldsDisplayLabel[i];
          end;

          t.Size := DtFieldName.Lookup('name',LookupResultFields[i],'length');//FieldSize[i];
          t.LookupDataSet := DtLookup;
          t.KeyFields := KeyFields;
          t.LookupKeyFields := LookupKeyFields;
          t.LookupResultField :=LookupResultFields[i];
          t.DataSet := Dt;

          for j:=0 to f.ComponentCount-1 do
          begin
            if f.Components[j] is TDBGridEh then
             if UpperCase(( f.Components[j] as TDBGridEh ).DataSource.DataSet.Name) = UpperCase(Dt.Name)  then
              if ( f.Components[j] as TDBGridEh ).FindFieldColumn(KeyFields)<>nil then
               with ( f.Components[j] as TDBGridEh ) do
                 begin               //将上面动态生成的LOOKUP字段添加到GRID表格控件中。
                 
                   colt:=Columns.Add;
                   colt.FieldName:= FieldName[i];
                   colt.ReadOnly:=True;            // 查看字段不可编辑。
                   colt.Width:= DtFieldName.Lookup('name',LookupResultFields[i],'GridWidth');   //GRID表格控件上的显示宽度
                   colt.Title.Hint:='不支持模糊过滤';
                   colt.Title.Color:=clScrollBar;
                   FieldColumns[FieldName[i]].Index :=  FieldColumns[KeyFields].Index +1;    // 调整返回的查看字段在GRID控件上的位置，即紧跟查看主键其后。

                   if  KeyFieldVisible=False then  //设主键在表格中不可见
                   FindFieldColumn(KeyFields).Visible:=False;
                 end;
          end;
      end;

  Dt.Open;
  DtFieldName.Free;
end;

procedure AddLookFields(F:TForm;DgEh:TDBGridEH;DtLookName:string; TableName:array of string;KeyFields,LookupKeyFields:string;
           FieldName,LookupResultFields:array of string;SQL:string='';DtReadOnly:Boolean=True;DisplayLast:Boolean=False);
var                          {功能：如果LOOKUP数据集是从单表中获取数据，该过程可只指定一个表名的参数，SQL可为空。}
colt:TColumnEH;              {如果LOOKUP数据集是从多表中获取数据，该过程指定多个表名参数，SQL不可为空。}
t: TStringField;             {如果该数据集存在，如果该表没有打开，就重新打开。如果该数据集不存，就创建}
i:integer;
DtLookup,DtFieldName:TADODataSet;
TNS:string;
begin
  for i:=0 to F.ComponentCount-1 do
  begin
        if (F.Components[i] is TADODataSet) then
        begin
           if UpperCase((F.Components[i] as TADODataSet).Name)=UpperCase(DtLookName) then //如果这个数据集找到
             begin
             if  (F.Components[i] as TADODataSet).Active=False then     //如果这个数据集没有打开
                  begin
                  if SQL='' then                                        
                     (F.Components[i] as TADODataSet).CommandText:='select * from '+TableName[0]  //如果是多表，SQL一定不会为空。所以这个地方这样写不会错。
                  else
                     (F.Components[i] as TADODataSet).CommandText:=SQL ;
                  if DtReadOnly=True then          //5-23修改
                  DtLookup.LockType:=ltReadOnly;
                  (F.Components[i] as TADODataSet).Open;                //数据集打开
                  end;
             DtLookup:=(F.Components[i] as TADODataSet);
             break;   //如果该数据集存在就结束该循环
             end ;
        end;

        if i= F.ComponentCount-1 then   //如果是最后一个组件
        begin
              DtLookup:=TADODataSet.Create(F);
              DtLookup.Name:=DtLookName;
              DtLookup.Connection:=DM.ADOConnection1;
              if SQL='' then
                 DtLookup.CommandText:='select * from '+TableName[0]
              else
                 DtLookup.CommandText:=SQL ;

              if DtReadOnly=True then
                DtLookup.LockType:=ltReadOnly;

              DtLookup.Open;
        end;
  end;


  TNS:='';
  TNS:=' Where O.name = '+quotedStr(TableName[0]);
  for i:=1 to High(TableName) do
  begin
    TNS:=TNS+' or  O.name = '+  quotedStr(TableName[i]) ;
  end;

  DtFieldName:=TADODataSet.Create(nil);
  DtFieldName.Connection:=DM.ADOConnection1;
  DtFieldName.CommandText:='select isnull(u.FieldNameCN,c.name)as FieldNameCN,c.Name,c.xtype,c.length, isnull(u.GridWidth,100)as GridWidth '
                          +' from dbo.syscolumns c join dbo.sysObjects  o on  c.id =o.id  '
                          +' left join dbo.UsSysFieldName u on u.TableName=o.name and u.FieldName=c.name ' +TNS;
  DtFieldName.LockType:=ltReadOnly;
  DtFieldName.Open;

  DgEh.DataSource.DataSet.Close;
      for I := High(FieldName) downto 0 do//用该种循环才能使下面GRID控件上显示的字段顺序符合需要。
      begin
          if DgEh.DataSource.DataSet.Fields.FindField(FieldName[i])<>nil then      //如果该字段已经存在，退出。
              begin
                myerror('动态添加的查看字段名：“'+FieldName[i]+'”已存在！');
                Exit;
              end;
                        //下面代码动态生成查看（LOOKUP）字段。
          t := TStringField.Create(DgEh.DataSource.DataSet);
          t.FieldKind := fkLookup;
          t.FieldName := FieldName[i];
        
          t.DisplayLabel:=DtFieldName.Lookup('name',LookupResultFields[i],'FieldNameCN');//DisplayLabel[i];
          
          t.Size := DtFieldName.Lookup('name',LookupResultFields[i],'length');//FieldSize[i];
          t.LookupDataSet := DtLookup;
          t.KeyFields := KeyFields;
          t.LookupKeyFields := LookupKeyFields;
          t.LookupResultField :=LookupResultFields[i];
          t.DataSet := DgEh.DataSource.DataSet;
                              //将上面动态生成的LOOKUP字段添加到GRID表格控件中。
          colt:=DgEh.Columns.Add;
          colt.FieldName:= FieldName[i];
          colt.ReadOnly:=True;            // 查看字段不可编辑。
          colt.Width:= DtFieldName.Lookup('name',LookupResultFields[i],'GridWidth');   //GRID表格控件上的显示宽度
          colt.Title.Hint:='不支持模糊过滤';
          colt.Title.Color:=clScrollBar;

          if DisplayLast=False then
            DgEh.FieldColumns[FieldName[i]].Index :=  DgEh.FieldColumns[KeyFields].Index +1;    // 调整返回的查看字段在GRID控件上的位置，即紧跟查看主键其后。

      end;
  DgEh.DataSource.DataSet.Open;
  DtFieldName.Free;
end;

procedure AddLookupFields(DgEh:TDBGridEH;DtLook:TObject;QryR:TADODataSet;FN:string;DL:string;KF:string;LF:string;LRF:string;FSize:integer=20);
var
colt:TColumnEH;
t: TStringField;
i,IKF,IFN:integer;

begin   {
DtLook:=TADODataSet.Create(nil);
(DtLook as TADODataSet).Connection:=DM.ADOConnection1;
if  (DtLook as TADODataSet).Active=False then  (DtLook as TADODataSet).Open;  }
if QrYR.Fields.FindField(FN)<>nil then Exit;
qryR.Close;
t := TStringField.Create(QryR);
t.FieldKind := fkLookup;
t.FieldName := FN;
t.DisplayLabel:=DL;
t.Size := FSize;
t.LookupDataSet := (DtLook as TADODataSet);
t.KeyFields := KF;
t.LookupKeyFields := LF;
t.LookupResultField :=LRF;
t.DataSet := QryR;
qryR.Open;

//将上面添加LOOKUP字段到GRID表格控件中。
              colt:=DgEh.Columns.Add;
              colt.FieldName:= fn;
              colt.ReadOnly:=True; // 如果是查看字段不可编辑。
 // 调整返回的查看字段在GRID控件上的位置，即紧跟查看主键其后。
for i:=0 to DgEh.Columns.Count-1 do
   begin
       if UpperCase(DgEh.Columns[i].FieldName)=UpperCase(KF) then ikf:=i;//全部转为大写字符。   主键的位置号
       if UpperCase(DgEh.Columns[i].FieldName)=UpperCase(FN) then ifn:=i;                      //返回的查看字段在GRID控件上的位置号
   end;
     DgEh.Columns[IFN].Index:=IKf+1;

end;

procedure AddFixFields(TableName:string;DgEh:TdbGridEH;SQLWhere:string='');
var
colt:TColumnEh;
temQry,fnCN,DTFieldOrder:TADODataSet;
i:integer;
begin
 //功能：数据集动态添加固定中文字段名。
DgEh.DataSource.DataSet.Close;
DgEh.DataSource.DataSet.Fields.Clear;
(DgEh.DataSource.DataSet as TADODataSet).CommandText:='select *  from '+tableName+#10#13+SQLWhere;
(DgEh.DataSource.DataSet as TADODataSet).Open;

temQry:=TADODataSet.Create(nil);
temQry.Connection:= DM.ADOConnection1;

fnCN:=TADODataSet.Create(nil);
fnCN.Connection:= DM.ADOConnection1;

//查询系统表字段名对应自定义中文字段名称。
fnCN.CommandText:='select FieldNameCN,c.IsNullable from dbo.sysObjects o join dbo.sysColumns c on o.id=c.id '
+'and o.name= '+QuotedStr(tableName)
+' left outer join dbo.usSYSFieldName u on tableName=o.name and fieldName=c.name  order by c.colOrder ';
fnCN.Open; //打开中文字段名表

 try
   temQry.clone((DgEh.DataSource.DataSet as TADODataSet),ltReadOnly);
   DgEh.DataSource.DataSet.Close;
   (DgEh.DataSource.DataSet as TADODataSet).Fields.Clear;
   for i := 0 to (temQry.FieldDefs.Count) - 1 do    //循环
   begin
      with DgEh.DataSource.DataSet.FieldDefs.Items[i].FieldClass.Create(nil) do
      begin
         FieldName := temQry.FieldDefs.Items[i].name;
         if  fnCN.FieldByName('FieldNameCN').AsString<>''then
         DisplayLabel :=fnCN.Fields[0].AsString;  // 添加中文字段名  ，特别说明，数据集的中文字段
         if fnCN.FieldByName('IsNullable').AsInteger=0 then  //如果数据库的字段不能为空，就设数据集字段不可为空的属性为真。
         Required:=True;
         size := temQry.FieldDefs.Items[i].size;

         Index := i;
         DataSet := DgEh.DataSource.DataSet;
         fnCN.Next;
      end;
   end;
   DgEh.DataSource.DataSet.FieldDefs.UpDate;
 finally
   DgEh.DataSource.DataSet.Close;
   if  SQLWhere<>'' then
       (DgEh.DataSource.DataSet as TADODataSet).CommandText:= 'select *  from '+tableName+' '+SQLWhere      //添加SQL查询条件
   else
       (DgEh.DataSource.DataSet as TADODataSet).CommandText:= 'select *  from '+tableName;
   // if end
   DgEh.DataSource.DataSet.open;
   temQry.Free;
   fnCN.Free;
 end;
//对DBGridEH控件操作
      DTFieldOrder:=TADODataSet.Create(nil);
      DTFieldOrder.Connection:=DM.ADOConnection1;
      DTFieldOrder.Close;
      DTFieldOrder.CommandText:='select c.Name,GridWidth,GridVisi,TitleButton,ReadOnly from dbo.sysobjects o join dbo.syscolumns c on o.id=c.id '
      +'left outer join dbo.usSYSFieldName on c.name =FieldName and o.name=tablename where o.name = '+quotedStr(tablename)+' order by FieldOrder';
      DTFieldOrder.Open;    //打开系统字段和用户自定义字段名称表。

      DgEh.Columns.Clear;   //清除已有的固定字段。
          while not (DTFieldOrder.Eof) do
          begin
              //GRID控件动态添加字段。
              colt:=DgEh.Columns.Add;
              colt.FieldName:= DTFieldOrder.FieldByName('name').AsString;
              if not(DTFieldOrder.FieldByName('GridWidth').IsNull) then
                     colt.Width:= DTFieldOrder.FieldByName('GridWidth').AsInteger;  //设置GRID控件的字段宽度
              if not(DTFieldOrder.FieldByName('GridVisi').IsNull)then
              if DTFieldOrder.FieldByName('GridVisi').AsBoolean=false then
                     colt.Visible:=false;    //ifend     //设置GRID控件的字段不可见
              colt.Title.Hint:='用%号模糊过滤';
              if DTFieldOrder.FieldByName('TitleButton').AsBoolean=True then
                  begin
                  colt.Title.TitleButton:=True;
                  if colt.Title.Hint<>'' then
                     colt.Title.Hint:=colt.Title.Hint+#10#13+'支持单击排序'
                  else
                     colt.Title.Hint:='支持单击排序'  ;
                  end;
              if DTFieldOrder.FieldByName('ReadOnly').AsBoolean then
                     colt.ReadOnly:=True;
              DTFieldOrder.Next;
          end ;
      DTFieldOrder.Free;

      DgEh.ShowHint:=True;
      for i:=0 to   DgEh.DataSource.DataSet.FieldCount-1 do
      begin
        if    DgEh.DataSource.DataSet.FieldList[i].Required then    //如果该字段不能为空
           begin
              DgEh.FieldColumns[DgEh.DataSource.DataSet.FieldList[i].FieldName].Title.Font.Color:=clBlue;   //蓝色字体显示
              if (DgEh.FieldColumns[DgEh.DataSource.DataSet.FieldList[i].FieldName].Title.Hint)<>'' then  //如果提示字符串不是空，
                 DgEh.FieldColumns[DgEh.DataSource.DataSet.FieldList[i].FieldName].Title.Hint:=
                             DgEh.FieldColumns[DgEh.DataSource.DataSet.FieldList[i].FieldName].Title.Hint+#10#13+'字段不能为空'
              else
                 DgEh.FieldColumns[DgEh.DataSource.DataSet.FieldList[i].FieldName].Title.Hint:='字段不能为空'; //提示
             // DgEh.FieldColumns[DgEh.DataSource.DataSet.FieldList[i].FieldName].Title.Hint:='字段不能为空'
           end;
      end;
end;

procedure OpenLookForm(Fm:TForm;Gd:TDBGrid;var Key: Char;SelectedFieldName:string;LooktableName:string;LookFields1,LookFields2:string;LookFields3:string='');
//var
  // DT:TADODataSet;
begin
  { if Key = #42 then
   if Fm.ActiveControl = Gd then
      begin
        if TDBGrid(Fm.ActiveControl).SelectedField.FieldName= SelectedFieldName  then
          begin
         //   if LookForm.DTLook is active then
                begin   //如果查看窗口数据集中没有记录，填写SQL语句，然后打开窗口，如果有记录直接显示（Show),先决条件是该窗口已经创建（create）
                  // myinfo('');
                   LookForm.DTLook.Close;
                   LookForm.DTLook.CommandText:='select '+LookFields1 + ' , ' + lookFields2 + ' From ' +LooktableName;
                   LookForm.DTLook.Open ;
                end;
          //  LookForm.DTLook.Recordset:=DT.Recordset;
            LookForm.Show;
           loadform:=FM;
            LoadFormGridName:=Gd;        
          //  Key := #0;
          end;     


       end;    }
end;

Function IsFloat(Fl:String=''):Boolean;
begin
try
 if ((StrToFloat(Fl))>=0) or ((StrToFloat(Fl))<0) then
 IsFloat:=true;
 except
  IsFloat:=false;
 end;
end;

procedure IsFloatMsg(Fl:String='';msg:string='');
begin
   if  IsFloat(Fl)=false then
   begin
     if msg<>'' then
       begin
         messagedlg(msg,mterror,[mbok],0);
         abort;
       end ;
         messagedlg('['+fl+']'+'不是个有效的"浮点"数值!',mterror,[mbok],0);
         abort;
   end;
end ;

Function ISDate(Dt:string=''):Bool;
begin
try
 if ((StrToDate(Dt))>=date) or ((StrToDate(Dt))<date) then
 ISDate:=true;
 except
  ISDate:=false;
 end;
end;

procedure IsDateMsg(Dt:String='';msg:string='');
begin
   if  IsDate(Dt)=false then
   begin
     if msg<>'' then
       begin
         messagedlg(msg,mterror,[mbok],0);
         abort;
       end ;
         messagedlg('['+Dt+']'+'不是个有效的"日期"数值!',mterror,[mbok],0);
         abort;
   end;
end ;

Function IsInt(Int:string=''):bool;
begin
try
 if ((StrToInt(int))>0) or ((StrToInt(int))<1) then
 isint:=true;
 except
  Result:=false;
 end;
end;

procedure IsIntMsg(Int:String='';msg:string='');
begin
if  IsInt(Int)=false then
   begin
   if msg<>'' then
       begin
         messagedlg(msg,mterror,[mbok],0);
         abort;
       end ;
         messagedlg('['+Int+']'+'不是个有效的"整型"数值!',mterror,[mbok],0);
         abort;
   end;
end ;

procedure FormDataSetClose(ds:TCustomADODataSet);
var
s:integer;
begin
if ds.Active then
  if  (ds.State=dsInsert) or (ds.State=dsEdit)then
  begin
     S:= messagedlg('数据还没有保存,你要保存吗?',mtconfirmation,[mbyes,mbno,mbcancel],0);
     if S = mryes  then
         ds.Post
     else if S = mrcancel then
         abort
     else if s=mrNo then
         ds.Cancel    ;
  end;
  {  s:=messagebox(0,'数据还没有保存，你要保存吗？','提示',MB_yesnocancel+MB_iconquestion)  ;
    if s=idyes then
    ds.Post
    else if s=idcancel then
    abort;   }
//messagebox(0,'你要退出吗','',MB_yesnocancel+MB_iconStop);
//MB_iconquestion          询问
//MB_iconinformation      信息
//MB_iconStop             错误
// messagebox(0,'你要退出吗','',MB_ok+MB_iconinformation);
{
if (ADODataSet1.State=dsinsert) or (ADODataSet1.State= dsedit) then
   }
end;

procedure DataSetToEdit(ds:TCustomADODataSet);
begin
if ds.Active then
if  (ds.State<>dsInsert) or (ds.State<>dsEdit)then
  begin
     ds.Edit;
  end;
end;

procedure KeyPressDBGridEH(Sender: TDBGridEH; var Key: Char;F:TForm);
var
i:integer;
begin

   if Key = #13 then
      if f.ActiveControl = Sender then
      begin
          if TDBGridEH(f.ActiveControl).SelectedIndex= TDBGridEH(f.ActiveControl).FieldCount-1 then  //如果选择是最后一行。
          begin
            DghReadOnlyFocus(Sender as TDBGridEh);
            //TDBGridEH(f.ActiveControl).SelectedIndex:=0 ;      //光标就跳回第一列。
            Key := #0;
          end
          else
          begin
             for i:=TDBGridEH(f.ActiveControl).SelectedIndex+1 to TDBGridEH(f.ActiveControl).FieldCount-1 do //
             begin
                 if (TDBGridEH(f.ActiveControl).Columns[i].ReadOnly=false) and (TDBGridEH(f.ActiveControl).Columns[i].Visible=true) then
                 begin
                     TDBGridEH(f.ActiveControl).SelectedIndex :=i; //TDBGridEH(f.ActiveControl).SelectedIndex+1
                     Key := #0;
                     exit;
                 end
                 else
                 if I=TDBGridEH(f.ActiveControl).FieldCount-1  then
                 begin
                     DghReadOnlyFocus(Sender as TDBGridEh);
                     //TDBGridEH(f.ActiveControl).SelectedIndex:=0 ;      //光标就跳回第一列。
                     Key := #0;
                 end;
             end;
          end;
       end;
end;

Function AddSQL(S:String):String;
begin//功能：用于动态SQL查询，如果被检查的SQL语句是空，返回WHERE 否则返回AND。
   if S='' then
   AddSQL:=' where  '
   else  //注意：一定要有空格
   AddSQL:=' and  ';
{用法：if trim(edit1.Text)<>'' then
       st:=ADDSQL(st)+' 采购单号 Like '+quotedstr(trim(edit1.Text));
       if trim(Combobox1.Text)<>'' then
       st:=addsql(st)+' 材料编号 like '+quotedstr(trim(combobox1.Text));

}
end;

Function AsSumQ(MyAs:TCustomADODataSet;FieldName:string):currency; //currency  是8字节的浮点实数类型
Var
Q:currency;
begin   //功能：接收两个参数，数据集名，字段名，返回该字段的合计数量。
  Q:=0;
  if Myas.RecordCount>0 then
  begin
     try
        myas.DisableControls;
        myAs.First;
        while not myAs.Eof do
           begin
           Q := Q + myas.fieldByName(FieldName).AsFloat;
           myas.Next;
           end;
     finally
        myas.EnableControls;
     end;
  end;
  AsSumQ := Q;
end;

Function GridPressEnterFieldNull(F:TForm;DBGrid1:TDBGrid;Col1,Col2:integer;
 var Key: Char;Col1NotNull:bool=False):bool;
begin
//功能：当在指定窗口，指定表格中，指定列上压下回车键时，如果指定当前列不能
//为空，当列值为空时，函数返回TRUE并从当前函数退出；否则返回FALSE并跳到指定的下一列上。
//
   if Key = #13 then
   begin
     if f.ActiveControl = DBGrid1 then
       begin
        if TDBGrid(f.ActiveControl).SelectedIndex= Col1 then
        if Col1NotNull= true then
         if TDBGrid(f.ActiveControl).Fields[Col1].AsString=''  then
              begin
                 result:= true;
                 exit;
              end
         else
          begin
            TDBGrid(f.ActiveControl).SelectedIndex:=Col2 ;
            Key := #0;
          end ;
       end;
     result:= False;
   end
   else result:= False;//如果键值不等于#13，返回值为False.   
end;



procedure CLS(FormName:TForm);  //调用：cls(self);或：CLS（MYFORMNAME）
var i:integer;
begin
for i:=FormName.ComponentCount-1 downto 0  do
  begin  //如果是TEDIT对象就将其清空。
      if (FormName.Components[i] is Tedit) then
       TEdit(FormName.Components[i]).Clear;
       //如果是TCOMBOBOX对象就将其清空。
      if (FormName.Components[i] is Tcombobox) then
        begin
        TCombobox(FormName.Components[i]).ItemIndex:=-1;
        TCombobox(FormName.Components[i]).Text:='';
        end;
  end;
end;

procedure EnterEdit(c1:TCustomEdit;C2:TWinControl;var Key: Char;NotNull:bool);
begin        //功能：如果在C
if key =#13 then
begin
  if NotNull=true then
    begin
       if  Trim(c1.Text)= '' then
       abort;
    end;
    C2.SetFocus;
end;
end;

procedure EnterCombobox(c1:TCustomComboBox;C2:TWinControl;var Key: Char;NotNull:bool=true);
begin
if key =#13 then
begin
  if NotNull=true then
    begin
       if  Trim(c1.Items.text)= '' then
       abort;
    end;
    C2.SetFocus;
end;
end;

procedure ET(FormName:TForm);  //调用：ET(self);或：ET（MYFORMNAME）
var i:integer;
begin   //设窗口上的所有Edit和Combobox类控件可用。
for i:=formname.ComponentCount-1 downto 0  do
  begin
      if (FormName.Components[i] is TCustomEdit) then
       TEdit(FormName.Components[i]).Enabled:=true;
       //
      if (FormName.Components[i] is TCustomComboBox) then
        TCombobox(FormName.Components[i]).Enabled:=True;
  end;
end;
procedure EF(FormName:TForm);  //调用：ET(self);或：ET（MYFORMNAME）
var i:integer;
begin        //设窗口上的所有Edit和Combobox类控件不可用。
for i:=formname.ComponentCount-1 downto 0  do
  begin
      if (FormName.Components[i] is TCustomEdit) then
       TEdit(FormName.Components[i]).Enabled:=False;
       //
      if (FormName.Components[i] is TCustomComboBox) then
        TCombobox(FormName.Components[i]).Enabled:=False;
  end;
end;

Function PrimKeyExists(Sql:string):boolean;
var
myqu:TADOquery;
begin
myqu:=tadoquery.Create(nil);
myqu.Connection:=dm.ADOConnection1;
myqu.LockType:=ltReadOnly;
myqu.SQL.Add(sql);
myqu.Open; //功能：通过执行SQL语句（可以是多表复杂查找），查找相关表中是否存在相关记录，即存在查找。如果找到返回真值，否则返回假值。
//用法：if PrimKeyExists('select * from GongYingShang where 供应商编号='+ quotedstr(trim(ADODateSet1.FieldByName('供应商编号').AsString )))=false then showmessage('不存在');
   if myqu.RecordCount>=1 then
   PrimKeyExists:=true
   else PrimKeyExists:=false;
myqu.Free;
end;

procedure SaveToExcel(DBGrid1:TDBGridEH;savedialog1:tsavedialog;row:integer=2;col :integer=2);
var //导出数据到对话框指定的Excel文件中，如果数据集的记录数大于零执行该过程。
  FvExcel: Variant;
  column,i: Integer;
begin
{调用：savedialog1.Filter:='Excel文件|*.XLS';
savedialog1.FileName:='车间IC在线分析表';
if adodataset1.RecordCount>0 then
SaveToExcel(dbgrid1,savedialog1,2); 
}   if DbGrid1.DataSource.DataSet.RecordCount<1 then
    begin
    myInfo('没有需要导出的记录！');
    exit;
    end;

   try
      FvExcel := CreateOleObject('Excel.Application');
    except
      Application.MessageBox('打开Excel失败',PChar(Application.Title),MB_ICONERROR);
      exit;
    end;
     FvExcel.Visible := false;
     FvExcel.Caption := '';
     if saveDialog1.Execute then
     begin
        FvExcel.WorkBooks.Open(saveDialog1.FileName); //打开工作簿
        FvExcel.WorkSheets[1].Activate;  //设置第1个工作表为活动工作表
       DBGrid1.DataSource.DataSet.First;
        while not (DBGrid1.DataSource.dataset.Eof) do
           begin
           column:=col ;
           for i := 1 to DBGrid1.FieldCount do
              begin
               FvExcel.Cells.Item[row + 1, column] := DBGrid1.Fields[i -1].AsString;
               column := column + 1;
              end;
           DBGrid1.DataSource.dataset.Next;
           row := row + 1;
         end;         
         FvExcel.Visible := True;
    end;
end;

procedure OutputExcel(DBGrid1:TDBGridEh;FileName:String;LabelName:string='');
var //导出数据到Excel文件中
  eclapp, workbook: Variant;
  row, column, i: Integer;
  SaveDialog:TSaveDialog;
  BM:Pointer;//TBookmark;
begin

//功能：把表格中的数据保存到你新建的EXCEL表中。
  if MessageDlg('你确定你安装了Microsoft Excel 97/2000/2003?', mtConfirmation, [mbyes, mbno], 0) <> idyes then
  begin
    exit;
  end
  else
  begin
    try       //生成一个Excel OleObject
        EclApp := CreateOleObject('Excel.Application');
        WorkBook := CreateOleObject('Excel.Sheet');
    except //产生例外保存
        showmessage('您的机器里面没有安装任何版本的Excel');
        Exit;
    end;
    SaveDialog:=TSaveDialog.Create(nil);
    SaveDialog.Filter:='Excel文件|*.XLS';
    SaveDialog.FileName:=FileName;
    try
       if savedialog.Execute then //保存Excel文件
         begin
            try
              bm:=DBGrid1.DataSource.DataSet.GetBookmark;//书签。
              workBook := EclApp.workBooks.Add;
              row := 2;
              EclApp.Workbooks.Item[1].Activate;
              //eclApp.Cells.font.colorindex := 5;
              if labelName='' then
                   LabelName:=FileName;
              EclApp.Activesheet.Cells(1, 1) := LabelName;
               // EclApp.Activesheet.Font.Size:=20;
              DBGrid1.DataSource.DataSet.DisableControls;
              DBGrid1.DataSource.DataSet.First;
      
              for I := 1 to DBGrid1.FieldCount do
              EclApp.Activesheet.Cells(2, I) := DBGrid1.Columns[I -1].Title.Caption;
              while not (DBGrid1.DataSource.DataSet.Eof) do
              begin
                  Column := 1;
                  for i := 1 to DBGrid1.FieldCount do
                  begin
                      eclApp.Cells.Item[row + 1, column] := DBGrid1.Fields[i -1].AsString;
                      column := column + 1;
                  end;
                  DBGrid1.DataSource.DataSet.Next;
                  row := row + 1;
              end;

            finally
              DBGrid1.DataSource.DataSet.GotoBookmark(BM);  // 重新定位到书签
              DBGrid1.DataSource.DataSet.FreeBookmark(bm ); //释放书签。
              DBGrid1.DataSource.DataSet.EnableControls;
            end;
           WorkBook.Saveas(SaveDialog.FileName);
           WorkBook.Saved := True;
           WorkBook.Close;
           eclApp.Quit;
           eclApp := Unassigned;
           MyInfo('数据成功导出到EXCEL!');
         end
       else
           begin
           workBook.Saved :=false;
           WorkBook.close;
           eclApp.Quit;
           eclApp := Unassigned;
           end;
    except
      myerror('Excel文件保存失败');
      WorkBook.close;
      eclApp.Quit;
      eclApp := Unassigned;
    end;
  end;
end;

procedure MyError(msg:string);
begin
messagedlg(msg,mterror,[mbok],0);
end;
procedure MyWarning(msg:string);
begin
messagedlg(msg,mtwarning,[mbok],0);
end;
procedure MyInfo(msg:string);
begin
messagedlg(msg,mtinformation,[mbok],0);
end;

procedure EditExitNull(sender:Tobject);
begin
if trim((sender as Tedit).Text)='' then
begin
    myError('该字段不能为空!');
    messagebeep(0);
    Abort;
end;
end;

procedure ComboboxExitNull(sender:Tobject);
begin
if (sender as TCustomComboBox).SelText='' then
begin
    myError('该字段不能为空!');
    messagebeep(0);
    Abort;
end;
end;

procedure SaveMsg;
    begin {
    myinformation('你录入的数据已成功保存!');
    mainform.StatusBar1.Panels[3].Text:='准备就绪';
    end;
    procedure SaveErrMsg;
    begin
      myerror('末知错误原因,数据保存失败!');   }
    end;

procedure checkstr(Edit1:TCustomEdit;name:string='');
      begin
        if trim( Edit1.Text)='' then
        begin
          Edit1.SetFocus;
          myError(name+'该字段不能为空!');
        //  messagebox(0,name+'该字段不能为空!','提示',MB_yesnocancel+MB_iconStop);
          abort;
        end;
      {  if trim((sender as tcombobox).Text)='' then
        begin
          (sender as tcombobox).SetFocus;
          mywarning(name+'该字段不能为空!');
          abort;
        end;        }
      end;
procedure comboboxAddItems(mycom:TCustomComboBox;mysql:string);
var
myqu:tadoquery;
begin
myqu:=TADOQuery.Create(nil);
myqu.Connection:=DM.ADOConnection1;

myqu.Close;
myqu.SQL.Clear;
myqu.SQL.Add(mysql);
myqu.LockType:=ltReadOnly;
myqu.Open;
myqu.First;
mycom.Clear;
while not( myqu.Eof )   do
  begin
    mycom.Items.Add(trim(myqu.FieldList[0].asstring));
    myqu.Next;
  end;
myqu.Free;
end;

procedure ADODataSetAddToComboboxItems(qu:TCustomADODataSet;co:TCustomComboBox;FieldName:string);
begin
  try
    qu.DisableControls;
    qu.First;
    while not( qu.Eof )   do
    begin
        co.Items.Add(trim(qu.FieldByName(FieldName).asstring));
        qu.Next;
    end;
  finally
    qu.EnableControls;
  end;
end;

function IsNumberic(Vaule:String):Boolean; //判断Vaule是不是数字
var
i:integer;
begin
//result:=true; //设置返回值为 是（真）
//Vaule:=trim(Vaule); //去空格
//for i:=1 to length(Vaule) do //准备循环
//begin
//if not (Vaule[i] in [0..9] )then //如果Vaule的第i个字不是0-9中的任一个
//begin
//result:=false; //返回值 不是（假）
//exit; //退出函数
//end;
//end;
end;

function IsUpperCase(Vaule:String):Boolean; //判断Vaule 是不是大写字母
var
i:integer;
begin
//result:=true; //设置返回值为 是
//Vaule:=trim(Vaule); //去空格
//for i:=1 to length(Vaule) do //准备循环
//begin
//if not (Vaule[i] in ['A'..'Z']) then //如果Vaule的第i个字不是A-Z中的任一个
//begin
//result:=false; //返回值 不是
//exit; //退出函数
//end;
//end;
end;

function IsLowerCase(Vaule:String):Boolean; //判断Vaule 是不是小写字母
var
i:integer;
begin 
//result:=true; //设置返回值为 是
//Vaule:=trim(Vaule); //去空格
//for i:=1 to length(Vaule) do //准备循环
//begin
//if not (Vaule[i] in ['a'..'z']) then //如果Vaule的第i个字不是a-z中的任一个
//begin
//result:=false; //返回值 不是
//exit; //退出函数
//end;
//end;
end;


function IsEnCase(Vaule:String):boolean; //判断Vaule 是不是字母
var
i:integer;
begin
//  result:=true; //设置返回值为 是
//  Vaule:=trim(Vaule); //去空格
//  for i:=1 to length(Vaule) do //准备循环
//    begin
//    if (not(Vaule[i] in ['A'..'Z']))and (not (Vaule[i] in ['a'..'z'])) then //如果Vaule的第i个字不是A-Z或者a-z中的任一个
//      begin
//      result:=false; //返回值 不是
//      exit; //退出函数
//      end;
//    end;
end;

procedure MsgError(AHandle:THandle;Msg:string);
begin
  messagebox(AHandle,PChar(Msg),'错误',MB_ok+MB_iconStop)  ;
  {  s:=messagebox(0,'数据还没有保存，你要保存吗？','提示',MB_yesnocancel+MB_iconquestion)  ;
    if s=idyes then
    ds.Post
    else if s=idcancel then
    abort;   }
//messagebox(0,'你要退出吗','',MB_yesnocancel+MB_iconStop);
//MB_iconquestion          询问
//MB_iconinformation      信息
//MB_iconStop             错误
// messagebox(0,'你要退出吗','',MB_ok+MB_iconinformation);
{
if (ADODataSet1.State=dsinsert) or (ADODataSet1.State= dsedit) then
   }
end;

procedure MsgWarning(AHandle:THandle;Msg:string);
begin

end;

procedure MsgInfo(AHandle:THandle;Msg:string);
begin

end;


end.
