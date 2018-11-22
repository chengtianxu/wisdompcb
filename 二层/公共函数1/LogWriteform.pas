unit LogWriteform;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Grids, DBGrids, DB, ADODB, Provider, DBClient, DBGridEh, PublicFile;

type
  TDataInfo=class
  private
    L_D859_rkey              :Integer;//data0859表的主键，
  protected
  public
    L_DataSetName            :TClientDataSet;//数据集名
    L_Rkey                   :string;        //主键字段名
    L_TableName              :string;        //表名
//    L_GridName               :TDBGridEh;     //表格名
//    L_SeqNo                  :Integer;       //编号
    L_LogFields              :array of string;   //  需要记录日志的字段，如果为空即所有的字段记录到日志中。
    L_IsWrite                :Boolean;           //为真时，这个表格需要写入日志中，如果一个窗口有多个数据集，其中的一个不需要写日志，就用这个控制。
  end;

type
  TLogWritefrm = class(TForm)
    DBGrid1: TDBGrid;
    cdsLog: TClientDataSet;
    dspLog: TDataSetProvider;
    dtLog: TADODataSet;
    dtLogDetailed: TADODataSet;
    dspLogDetailed: TDataSetProvider;
    DataSource1: TDataSource;
    DataSource2: TDataSource;
    cdsLogD073_ptr: TIntegerField;
    cdsLogOperDate: TDateTimeField;
    cdsLogCompName: TStringField;
    cdsLogDetailed: TClientDataSet;
    DBGridEh1: TDBGridEh;
    cdsLogDetailedRkey: TAutoIncField;
    cdsLogDetailedFieldName: TStringField;
    cdsLogDetailedNewValue: TMemoField;
    cdsLogDetailedOldValue: TMemoField;
    cdsLogRow_ptr: TIntegerField;
    cdsLogUSER_LOGIN_NAME: TStringField;
    cdsLogUSER_FULL_NAME: TStringField;
    cdsLog0: TClientDataSet;
    cdsLogDetailed0: TClientDataSet;
    dtRead: TADODataSet;
    dspRead: TDataSetProvider;
    cdsLog1: TClientDataSet;
    cdsLogDetailed1: TClientDataSet;
    cdsLogD859_ptr: TIntegerField;
    qryD859: TADOQuery;
    dtLogD859_ptr: TIntegerField;
    dtLogRow_ptr: TIntegerField;
    dtLogD073_ptr: TIntegerField;
    dtLogOperDate: TDateTimeField;
    dtLogCompName: TStringField;
    dtLogDetailedRkey: TAutoIncField;
    dtLogDetailedD859_ptr: TIntegerField;
    dtLogDetailedRow_ptr: TIntegerField;
    dtLogDetailedFieldName: TStringField;
    dtLogDetailedOldValue: TMemoField;
    dtLogDetailedNewValue: TMemoField;
    TempCDS: TClientDataSet;
    TempCDS1: TClientDataSet;
    cdsLogDetailedD860_ptr: TIntegerField;
    cdsLogRkey: TIntegerField;
    ADOCommand1: TADOCommand;
    procedure cdsLogAfterScroll(DataSet: TDataSet);
  private
    Output_SQL:string;
    { Private declarations }
  public
    { Public declarations }
  end; 

var
  LogWritefrm: TLogWritefrm;
  PCName: string;    //电脑名
  IsLog:Boolean;     //如果是真，将会记录日志
  Function Log_Add(var vData_Info:array of TDataInfo):Boolean; StdCall;//将修改的记录生成日志所需要的SQL语句赋值给 Output_SQL
  Function Log_Save():Boolean; StdCall;                                //将上面生成的SQL执行，如果成功返回为真。在ClientAataSet数据Post后ApplyUpdates前
  procedure Log_See(TableName:string;Row_ID:Integer);StdCall;          //查看日志

implementation

uses DM_f;

{$R *.dfm}

Function Log_Save():Boolean; StdCall;
begin
  Result:=False;
  with     LogWritefrm do
  try
    try
      if Output_SQL<>'' then
      begin
        ADOCommand1.CommandText:= Output_SQL;
        ADOCommand1.Execute;
      end;
      Result:=True;
    except
      ShowMessage('日志保存失败！');
    end;
  finally
    Output_SQL:='';
  end;
end;

Function Log_Add(var vData_Info:array of TDataInfo):Boolean;
var
  i,Fields_Count:Integer;
  str_SQL:string;
begin
  {如果先写入日志，万一主记录写入不成功就要回滚（这种可能性比较多）；
  如果是主记录先写入成功后，再写入日志，这样就必须先将没更新前(ApplyUpdates)的记录修改值记录下来}
  Result:=False;
  if Assigned(LogWritefrm)=False then
    LogWritefrm:=TLogWritefrm.Create(Application);

  with LogWritefrm do
  try
    Output_SQL:='declare @ID int ';
    for i:=0 to  High(vData_Info) do
    with  vData_Info[i] do
    begin
      if vData_Info[i].L_IsWrite then
      begin
        if L_D859_rkey<=0 then
        begin
          qryD859.Close;
          qryD859.Parameters.ParamByName('TableName').Value:=L_TableName;
          qryD859.Open;
          L_D859_rkey:= qryD859.Fields[0].Value;
          qryD859.Close;
        end;

        TempCDS .Data:=L_DataSetName.Data;
        if L_DataSetName.ChangeCount>0 then
          TempCDS1.Data:=L_DataSetName.Delta  ;

        if TempCDS.Active then
        with  TempCDS do
        begin
          First;
          while not Eof do
          begin
            if UpdateStatus=usModified   then
            begin
              str_SQL:='';
              if High(L_LogFields )>0 then
              begin
                for Fields_Count:=0 to  High(L_LogFields) do
                begin
                  with FieldByName(L_LogFields[Fields_Count])  do
                  if FieldKind=fkData then
                  if VarToStr(OldValue)<>VarToStr(NewValue) then
                  begin
                    str_SQL:= str_SQL
                    +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue],[NewValue]) '
                    +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
                    +','+QuotedStr(VarToStr(OldValue))+','+QuotedStr(VarToStr(NewValue))+') ';
                  end;
                end;
              end
              else
              begin
                for Fields_Count:=0 to  FieldCount-1 do
                begin
                  with Fields[Fields_Count]  do
                  if FieldKind=fkData then
                  if VarToStr(OldValue)<>VarToStr(NewValue) then
                  begin
                    str_SQL:= str_SQL
                    +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue],[NewValue]) '
                    +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
                    +','+QuotedStr(VarToStr(OldValue))+','+QuotedStr(VarToStr(NewValue))+') ';
                  end;
                end;
              end;
              Output_SQL:=Output_SQL+
              'insert into data0860([D859_ptr],[Row_ptr],[D073_ptr],[CompName]) '
              +#13+'values('+IntToStr(L_D859_rkey)+','+FieldByName(L_Rkey).AsString
              +','+IntToStr(UserRKEY)+','+QuotedStr(PCname)+') '
              +#13+'select @ID=@@identity  ' +str_SQL;
            end;
            Next;
          end;
          Close;
        end;

        if TempCDS1.Active then        //插入删除记录的日志
        with  TempCDS1 do
        begin
          First;
          while not Eof do
          begin
            if UpdateStatus=usDeleted   then
            begin
              str_SQL:='';
              if High(L_LogFields )>0 then
              begin
                for Fields_Count:=0 to  High(L_LogFields) do
                begin
                  with FieldByName(L_LogFields[Fields_Count])  do
                  if FieldKind=fkData then
                  begin
                    str_SQL:= str_SQL
                    +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue]) '
                    +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
                    +','+QuotedStr(VarToStr(OldValue))+') ';
                  end;
                end;
              end
              else
              begin
                for Fields_Count:=0 to  FieldCount-1 do
                begin
                  with Fields[Fields_Count]  do
                  if FieldKind=fkData then
                  begin
                    str_SQL:= str_SQL
                    +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue]) '
                    +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
                    +','+QuotedStr(VarToStr(OldValue))+') ';
                  end;
                end;
              end;
              Output_SQL:=Output_SQL+
              'insert into data0860([D859_ptr],[Row_ptr],[D073_ptr],[CompName]) '
              +#13+'values('+IntToStr(L_D859_rkey)+','+FieldByName(L_Rkey).AsString
              +','+IntToStr(UserRKEY)+','+QuotedStr(PCname)+') '
              +#13+'select @ID=@@identity  ' +str_SQL;
            end;
            Next;
          end;
          Close;
        end;
      end;
    end ;
     // ShowMessage(output_SQL);
  except
    output_SQL:='';
  end;
  Result:=True;
end;

//Function Log_Add(var vData_Info:array of TDataInfo):Boolean;
//var
//  i,Fields_Count:Integer;
//  str_SQL:string;
//begin
//  {如果先写入日志，万一主记录写入不成功就要回滚（这种可能性比较多）；
//  如果是主记录先写入成功后，再写入日志，这样就必须先将没更新前(ApplyUpdates)的记录修改值记录下来}
//  Result:=False;
//  if Assigned(LogWritefrm)=False then
//    LogWritefrm:=TLogWritefrm.Create(Application);
//
//  with LogWritefrm do
//  try
//    Output_SQL:='declare @ID int ';
//    for i:=0 to  High(vData_Info) do
//    with  vData_Info[i] do
//    begin
//      if vData_Info[i].L_IsWrite then
//      begin
//        if L_D859_rkey<=0 then
//        begin
//          qryD859.Close;
//          qryD859.Parameters.ParamByName('TableName').Value:=L_TableName;
//          qryD859.Open;
//          L_D859_rkey:= qryD859.Fields[0].Value;
//          qryD859.Close;
//        end;
//
//        TempCDS.Data:=L_DataSetName.Data  ;
//        if TempCDS.Active then
//        with  TempCDS do
//        begin
//          First;
//          while not Eof do
//          begin
//            if UpdateStatus=usModified   then
//            begin
//              str_SQL:='';
//              if High(L_LogFields )>0 then
//              begin
//                for Fields_Count:=0 to  High(L_LogFields) do
//                begin
//                  with FieldByName(L_LogFields[Fields_Count])  do
//                  if OldValue<>NewValue then
//                  begin
//                    str_SQL:= str_SQL
//                    +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue],[NewValue]) '
//                    +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
//                    +','+QuotedStr(VarToStr(OldValue))+','+QuotedStr(VarToStr(NewValue))+') ';
//                  end;
//                end;
//              end
//              else
//              begin
//                for Fields_Count:=0 to  FieldCount-1 do
//                begin
//                  with Fields[Fields_Count]  do
//                  if FieldKind=fkData then
//                  if OldValue<>NewValue then
//                  begin
//                    str_SQL:= str_SQL
//                    +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue],[NewValue]) '
//                    +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
//                    +','+QuotedStr(VarToStr(OldValue))+','+QuotedStr(VarToStr(NewValue))+') ';
//                  end;
//                end;
//              end;
//              Output_SQL:=Output_SQL+
//              'insert into data0860([D859_ptr],[Row_ptr],[D073_ptr],[CompName]) '
//              +#13+'values('+IntToStr(L_D859_rkey)+','+FieldByName(L_Rkey).AsString
//              +','+IntToStr(UserRKEY)+','+QuotedStr(PCname)+') '
//              +#13+'select @ID=@@identity  ' +str_SQL;
//            end
//            else
//            if UpdateStatus=usDeleted   then
//            begin
//              str_SQL:='';
//              if High(L_LogFields )>0 then
//              begin
//                for Fields_Count:=0 to  High(L_LogFields) do
//                begin
//                  with FieldByName(L_LogFields[Fields_Count])  do
//                  if OldValue<>NewValue then
//                  begin
//                    str_SQL:= str_SQL
//                    +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue]) '
//                    +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
//                    +','+QuotedStr(VarToStr(OldValue))+') ';
//                  end;
//                end;
//              end
//              else
//              begin
//                for Fields_Count:=0 to  FieldCount-1 do
//                begin
//                  with Fields[Fields_Count]  do
//                  if FieldKind=fkData then
//                  if OldValue<>NewValue then
//                  begin
//                    str_SQL:= str_SQL
//                    +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue]) '
//                    +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
//                    +','+QuotedStr(VarToStr(OldValue))+') ';
//                  end;
//                end;
//              end;
//              Output_SQL:=Output_SQL+
//              'insert into data0860([D859_ptr],[Row_ptr],[D073_ptr],[CompName]) '
//              +#13+'values('+IntToStr(L_D859_rkey)+','+FieldByName(L_Rkey).AsString
//              +','+IntToStr(UserRKEY)+','+QuotedStr(PCname)+') '
//              +#13+'select @ID=@@identity  ' +str_SQL;
//
//            end;
//            Next;
//          end;
//          Close;
//        end;
//      end;
//    end ;
//     // ShowMessage(output_SQL);
//  except
//    output_SQL:='';
//  end;
//  Result:=True;
//end;

procedure Log_See(TableName:string;Row_ID:Integer);
begin
  if Assigned(LogWritefrm)=False then
    LogWritefrm:=TLogWritefrm.Create(Application);
  with LogWritefrm do
  begin
    with cdsLog do
    begin
      Close;
      Params.ParamByName('TableName').Value   := TableName;
      Params.ParamByName('Row_ptr').Value     := Row_ID;
      Open;
      Last;
    end;
    ShowModal;
  end;
end;

procedure TLogWritefrm.cdsLogAfterScroll(DataSet: TDataSet);
begin
  cdsLogDetailed.Close ;
  cdsLogDetailed.Params.ParamByName('D860_ptr').Value:=cdsLogRkey.Value;
  //cdsLogDetailed.Params.ParamByName('Row_ptr').Value:=cdsLogRow_ptr.Value;
  cdsLogDetailed.Open;
end;

//Function Log_Add(SelfForm:TForm;var vData_Info:array of TDataInfo):Boolean;
//var
//  i,Fields_Count:Integer;
//  str_SQL:string;
//begin
//  {如果先写入日志，万一主记录写入不成功就要回滚（这种可能性比较多）；
//  如果是主记录先写入成功后，再写入日志，这样就必须先将没更新前(ApplyUpdates)的记录修改值记录下来}
//  Result:=False;
//  if Assigned(LogWritefrm)=False then
//    LogWritefrm:=TLogWritefrm.Create(Application);
//  with LogWritefrm do
//  begin
//    for i:=0 to  High(vData_Info) do
//    begin
//      if vData_Info[i].L_IsWrite then
//      begin
//        if i= 0 then
//          begin
//            //if  VarIsEmpty(vData_Info[i].L_DataSetName.Delta) =False then
//            TempCDS.Data:=vData_Info[i].L_DataSetName.Data  ;
//          end
//        else
//        if i= 1 then
//          begin
//            //if vData_Info[i].L_DataSetName.ChangeCount>0 then
//            TempCDS1.Data:=vData_Info[i].L_DataSetName.Data  ;
//          end ;
//
//        if vData_Info[i].L_D859_rkey<=0 then
//        begin
//          qryD859.Close;
//          qryD859.Parameters.ParamByName('TableName').Value:=vData_Info[i].L_TableName;
//          qryD859.Open;
//          vData_Info[i].L_D859_rkey:= qryD859.Fields[0].Value;
//          qryD859.Close;
//        end;
//      end;
//    end ;
//
//    Output_SQL:='declare @ID int ';
//    if TempCDS.Active then
//    with  TempCDS do
//    begin
//      First;
//      while not Eof do
//      begin
//        with   vData_Info[0] do
//        begin
//          if UpdateStatus=usModified   then
//          begin
//            str_SQL:='';
//            if High(L_LogFields )>0 then
//            begin
//              for Fields_Count:=0 to  High(L_LogFields) do
//              begin
//                with FieldByName(L_LogFields[Fields_Count])  do
//                if OldValue<>NewValue then
//                begin
//                  str_SQL:= str_SQL
//                  +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue],[NewValue]) '
//                  +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
//                  +','+QuotedStr(VarToStr(OldValue))+','+QuotedStr(VarToStr(NewValue))+') ';
//                end;
//              end;
//            end
//            else
//            begin
//              for Fields_Count:=0 to  FieldCount-1 do
//              begin
//                with Fields[Fields_Count]  do
//                if FieldKind=fkData then
//                if OldValue<>NewValue then
//                begin
//                  str_SQL:= str_SQL
//                  +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue],[NewValue]) '
//                  +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName). DisplayLabel)
//                  +','+QuotedStr(VarToStr(OldValue))+','+QuotedStr(VarToStr(NewValue))+') ';
//                end;
//              end;
//            end;
//            Output_SQL:=Output_SQL+
//            'insert into data0860([D859_ptr],[Row_ptr],[D073_ptr],[CompName]) '
//            +#13+'values('+IntToStr(L_D859_rkey)+','+FieldByName(L_Rkey).AsString
//            +','+IntToStr(UserRKEY)+','+QuotedStr(PCname)+') '
//            +#13+'select @ID=@@identity  ' +str_SQL;
//          end;
//        end;
//        Next;
//      end;
//      Close;
//    end;
//
//    if TempCDS1.Active then
//    with  TempCDS1 do
//    begin
//      First;
//      while not Eof do
//      begin
//        with   vData_Info[1] do
//        begin
//          if UpdateStatus=usModified   then
//          begin
//            str_SQL:='';
//            if High(L_LogFields )>0 then
//            begin
//              for Fields_Count:=0 to  High(L_LogFields) do
//              begin
//                with FieldByName(L_LogFields[Fields_Count])  do
//                if OldValue<>NewValue then
//                begin
//                  str_SQL:= str_SQL
//                  +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue],[NewValue]) '
//                  +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName).DisplayLabel)
//                  +','+QuotedStr(VarToStr(OldValue))+','+QuotedStr(VarToStr(NewValue))+') ';
//                end;
//              end;
//            end
//            else
//            begin
//              for Fields_Count:=0 to  FieldCount-1 do
//              begin
//                with Fields[Fields_Count]  do
//                if OldValue<>NewValue then
//                begin
//                  str_SQL:= str_SQL
//                  +#13+'insert into data0861([D860_ptr],[FieldName],[OldValue],[NewValue]) '
//                  +#13+'values(@ID,'+QuotedStr(L_DataSetName.FieldByName(FieldName).DisplayLabel)
//                  +','+QuotedStr(VarToStr(OldValue))+','+QuotedStr(VarToStr(NewValue))+') ';
//                end;
//              end;
//            end;
//            Output_SQL:=Output_SQL+
//            'insert into data0860([D859_ptr],[Row_ptr],[D073_ptr],[CompName]) '
//            +#13+'values('+IntToStr(L_D859_rkey)+','+FieldByName(L_Rkey).AsString
//            +','+IntToStr(UserRKEY)+','+QuotedStr(PCname)+') '
//            +#13+'select @ID=@@identity  ' +str_SQL;
//          end;
//        end;
//        Next;
//      end;
//      Close;
//    end;
//    ShowMessage(output_SQL);
//  end;
//
//  Result:=True;
//end;


   // ShowMessage(Output_SQL);
//      if   TempCDS1.Active then
//      with  TempCDS1 do
//      begin
//        First;
//        while not Eof do
//        begin
//          if UpdateStatus=usModified   then
//          if High(vData_Info[1].L_LogFields )>0 then
//          begin
//            for Fields_Count:=0 to  High(vData_Info[1].L_LogFields)-1 do
//            begin
//              with FieldByName(vData_Info[1].L_LogFields[Fields_Count])  do
//              if OldValue<>NewValue then
//              begin
//                Output_SQL:= Output_SQL+
//                'insert into data0860([D859_ptr],[Row_ptr],[D073_ptr],[CompName]) '
//                +'values('+IntToStr(vData_Info[1].L_D859_rkey)+','+FieldByName(vData_Info[1].L_Rkey).AsString
//                +','+IntToStr(UserRKEY)+','+QuotedStr(PCname)+') '
//                +'select @ID=@@identity  '
//                +'insert into data0861([D860_ptr],[FieldName],[OldValue],[NewValue]) '
//                +'values(@ID,'+QuotedStr(DisplayLabel)+','+QuotedStr(VarToStr(OldValue))+','+QuotedStr(VarToStr(NewValue))+')';
//              end;
//            end;
//          end;
//          Next;
//        end;
//      end;
    //
//    end;


//Function Log_Save1(var vData_Info:array of TDataInfo):Boolean;
//var
//  i:Integer;
//begin
//  Result:=False;
//  with LogWritefrm do
//  begin
//    for i:=0 to  High(vData_Info) do
//    begin
//      if i=0 then
//      begin
//        if cdsLogDetailed0.ChangeCount>0 then
//        begin
//          if cdsLog0.ApplyUpdates(0)=0 then
//          if cdsLogDetailed0.ApplyUpdates(0)=0 then
//            Result:=True;
//        end;
//      end
//      else
//      if i=1 then
//      begin
//        if cdsLogDetailed1.ChangeCount>0 then
//        begin
//          if cdsLog1.ApplyUpdates(0)=0 then
//          if cdsLogDetailed1.ApplyUpdates(0)=0 then
//            Result:=True;
//        end;
//      end
//
//    end;
//
//  end;
//end;

//Function Log_Save():Boolean;
//begin
//  Result:=False;
//  with LogWritefrm do
//  begin
////    ShowMessage(IntToStr(cdsLog.ChangeCount));
////    ShowMessage(IntToStr(cdsLogDetailed.ChangeCount));
//    if cdsLog.ApplyUpdates(0)=0 then
//    if cdsLogDetailed.ApplyUpdates(0)=0 then
//      Result:=True;
//  end;
//end;

//Function Log_Add1(SelfForm:TForm;var vData_Info:array of TDataInfo):Boolean; //只有1个数据集的日志添加
//var
//  i:Integer;
//  procedure WriteMain(AClientDataSet:TClientDataSet);
//  begin     
//    with   AClientDataSet do
//    begin
//      if Active=False then
//        Open;
//      if  vData_Info[i].L_IsWrite then
//      begin
//        Append;
//        FieldByName('D859_ptr')    .Value:=vData_Info[i].L_D859_rkey;
//        FieldByName('Row_ptr')     .Value:=vData_Info[i].L_DataSetName.FieldByName(vData_Info[i].L_Rkey).Value;
//        FieldByName('D073_ptr')    .Value:=UserRKEY;
//        FieldByName('CompName')    .Value:=PCName;
//        Post;
//      end;
//    end;
//  end;
//  procedure WriteDetailed(AClientDataSet:TClientDataSet);
//  var
//    Fields_Count:Integer;
//   // TempCDS:TClientDataSet;
//  begin
//    with  AClientDataSet do
//    begin
//      if Active =False then
//        Open;
//      if  vData_Info[i].L_IsWrite=False then
//        Exit;
//        
//      if High(vData_Info[i].L_LogFields)>0 then
//      begin
//        for Fields_Count:=0 to  High(vData_Info[i].L_LogFields)-1 do
//        begin
//         // if vData_Info[i].L_DataSetName.UpdateStatus=usModified then          //如果状态是修改才执行下面的代码.
//          with vData_Info[i].L_DataSetName.FieldByName(vData_Info[i].L_LogFields[Fields_Count])  do
//          if OldValue<>NewValue then
//          begin
//            Append;
//            FieldByName('D859_ptr')    .Value:=vData_Info[i].L_D859_rkey;
//            FieldByName('Row_ptr')     .Value:=vData_Info[i].L_DataSetName.FieldByName(vData_Info[i].L_Rkey).Value;
//            FieldByName('FieldName')   .Value:=DisplayLabel;  // FieldName
//            FieldByName('OldValue')    .Value :=OldValue;
//            FieldByName('NewValue')    .Value :=NewValue;
//            Post;
//          end;
//        end;
//      end
//      else                //如果没有设置L_LogFields，即全部的字段记录日志。
//      begin
//        for Fields_Count:=0 to vData_Info[i].L_DataSetName.FieldCount-1 do
//        begin
//          with vData_Info[i].L_DataSetName.Fields[Fields_Count]  do
//          if OldValue<>NewValue then
//          begin
//            Append;
//            FieldByName('D859_ptr')    .Value:=vData_Info[i].L_D859_rkey;
//            FieldByName('Row_ptr')     .Value:=vData_Info[i].L_DataSetName.FieldByName(vData_Info[i].L_Rkey).Value;            
//            FieldByName('FieldName').Value:=DisplayLabel;  // FieldName
//            FieldByName('OldValue').Value :=OldValue;
//            FieldByName('NewValue').Value :=NewValue;
//            Post;
//          end;
//        end;
//      end ;
//
////      if Logfrm.cdsLogDetailed.ChangeCount<=0 then
////      begin
////        cdsLog.CancelUpdates;
////      end;
//    end;
//  end;
//begin
//  {如果先写入日志，万一主记录写入不成功就要回滚（这种可能性比较多）；
//  如果是主记录先写入成功后，再写入日志，这样就必须先将没更新前(ApplyUpdates)的记录修改值记录下来}
//  Result:=False;
//  if High(vData_Info)>-1 then
//  begin
//    if Assigned(LogWritefrm)=False then
//      LogWritefrm:=TLogWritefrm.Create(Application);
//
//    with LogWritefrm do
//    begin
//
//      for i:=0 to High(vData_Info)do
//      with  vData_Info[i] do
//      begin
//        if L_D859_rkey<=0 then
//        begin
//          qryD859.Parameters.ParamByName('D419_ptr')   .Value:=D419Rkey;
//          qryD859.Parameters.ParamByName('FormName')   .Value:=SelfForm.Name;
//          qryD859.Parameters.ParamByName('DataSetName').Value:=L_DataSetName.Name;
//          qryD859.Open;
//          L_D859_rkey:= qryD859.Fields[0].Value;
//          qryD859.Close;
//        end;
//
//        if i=0 then      // 添加日志主表
//          begin
//            WriteMain(cdsLog0) ;
//            WriteDetailed(cdsLogDetailed0) ;
//          end
//        else
//        if i=1 then
//          begin
//
//            L_DataSetName.First;
//            while not L_DataSetName.Eof  do
//            begin
//              if  L_DataSetName.UpdateStatus=usModified then
//              begin
//                WriteMain(cdsLog1);
//                WriteDetailed(cdsLogDetailed1) ;
//              end;
//              L_DataSetName.Next;
//            end;
//          end;
////        ShowMessage(IntToStr(cdsLog.ChangeCount));
////        ShowMessage(IntToStr(cdsLogDetailed.ChangeCount));
//      end;
//    end;
//  end;
//  Result:=True;
//end;
                                                                                          //;var Row_ID:Integer
//Function Log_Add(SelfForm:TForm;var vData_Info:array of TDataInfo):Boolean;
//var
//  i,Fields_Count:Integer;
//begin
//  {如果先写入日志，万一主记录写入不成功就要回滚（这种可能性比较多）；
//  如果是主记录先写入成功后，再写入日志，这样就必须先将没更新前(ApplyUpdates)的记录修改值记录下来}
//  Result:=False;
//  if Assigned(LogWritefrm)=False then
//    LogWritefrm:=TLogWritefrm.Create(Application);
//  with LogWritefrm do
//  begin
//    for i:=0 to  High(vData_Info) do
//    begin
//      if vData_Info[i].L_IsWrite then
//      begin
//        if cdsLog.Active=False then       // 添加日志主表
//        begin
//          cdsLog. Params.ParamByName('D419_ptr').Value:= D419Rkey;
//          cdsLog. Params.ParamByName('FormName').Value:= SelfForm.Name;
//          cdsLog. Params.ParamByName('GridName').Value:= vData_Info[i].L_GridName.Name;
//          cdsLog.Open;
//        end;
//
//        cdsLog.Append;
//        cdsLog.FieldByName('D419_ptr')    .Value:=D419Rkey;
//        cdsLog.FieldByName('D073_ptr')    .Value:=UserRKEY;
//        cdsLog.FieldByName('FormName')    .Value:=SelfForm.Name;
//        cdsLog.FieldByName('GridName')    .Value:=vData_Info[i].L_GridName.Name;
//        cdsLog.FieldByName('CompName')    .Value:=PCName;
//        cdsLog.FieldByName('Row_ptr')     .Value:=vData_Info[i].L_DataSetName.FieldByName('rkey').Value;
//        cdsLog.Post;
//
//        if High(vData_Info[i].L_LogFields)>0 then     //添加日志明细表
//        begin
//          if LogWritefrm.cdsLogDetailed.Active =False then
//            LogWritefrm.cdsLogDetailed.Open;
//          for Fields_Count:=0 to  High(vData_Info[i].L_LogFields)-1 do
//          begin
//            if vData_Info[i].L_DataSetName.UpdateStatus=usModified then          //如果状态是修改才执行下面的代码.
//            with vData_Info[i].L_DataSetName.FieldByName(vData_Info[i].L_LogFields[Fields_Count])  do
//            if OldValue<>NewValue then
//            begin
//              LogWritefrm.cdsLogDetailed.Append;
//              LogWritefrm.cdsLogDetailed.FieldByName('FieldName').Value:=DisplayLabel;  // FieldName
//              LogWritefrm.cdsLogDetailed.FieldByName('OldValue').Value :=OldValue;
//              LogWritefrm.cdsLogDetailed.FieldByName('NewValue').Value :=NewValue;
//              LogWritefrm.cdsLogDetailed.Post;
//            end;
//          end;
//        end
//        else                //如果没有设置L_LogFields，即全部的字段记录日志。
//        begin
//          if LogWritefrm.cdsLogDetailed.Active =False then
//            LogWritefrm.cdsLogDetailed.Open;
//          for Fields_Count:=0 to vData_Info[i].L_DataSetName.FieldCount-1 do
//          begin
//            with vData_Info[i].L_DataSetName.Fields[Fields_Count]  do
//            if OldValue<>NewValue then
//            begin
//              LogWritefrm.cdsLogDetailed.Append;
//              LogWritefrm.cdsLogDetailed.FieldByName('FieldName').Value:=DisplayLabel;  // FieldName
//              LogWritefrm.cdsLogDetailed.FieldByName('OldValue').Value :=OldValue;
//              LogWritefrm.cdsLogDetailed.FieldByName('NewValue').Value :=NewValue;
//              LogWritefrm.cdsLogDetailed.Post;
//            end;
//          end;
//        end ;
//
//        if LogWritefrm.cdsLogDetailed.ChangeCount<=0 then
//        begin
//          cdsLog.CancelUpdates;
//        end;
//      end;  
//    end ;
//    ShowMessage(IntToStr(cdsLog.ChangeCount));
//    ShowMessage(IntToStr(cdsLogDetailed.ChangeCount));
//  end;
//
//  Result:=True;
//end;



//procedure TLogWritefrm.cdsLogAfterClose(DataSet: TDataSet);
//begin
//  cdsLogDetailed.Close;
//end;
//
//procedure TLogWritefrm.cdsLogDetailedReconcileError(
//  DataSet: TCustomClientDataSet; E: EReconcileError;
//  UpdateKind: TUpdateKind; var Action: TReconcileAction);
//begin
//  MsgError('保存失败，原因是：'+E.Message);
//end;
//
//procedure TLogWritefrm.cdsLogReconcileError(DataSet: TCustomClientDataSet;
//  E: EReconcileError; UpdateKind: TUpdateKind;
//  var Action: TReconcileAction);
//begin
//  MsgError('保存失败，原因是：'+E.Message);
//end;

end.
