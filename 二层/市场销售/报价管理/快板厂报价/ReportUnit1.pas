unit ReportUnit1;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Menus;

type
  TMainForm1 = class(TForm)
    MainMenu1: TMainMenu;
    N1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    procedure N3Click(Sender: TObject);
    procedure N2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    user_ptrs,vprevs,db_ptrs:string;
    hMapFile: THandle;
    MapFilePointer: Pointer;
  public
    { Public declarations }
  end;

var
  MainForm1: TMainForm1;

implementation

uses DMUnit1,PrintUnit2;

{$R *.dfm}

procedure TMainForm1.N3Click(Sender: TObject);
begin
   close ;
end;

procedure TMainForm1.N2Click(Sender: TObject);
begin
  PrintForm2 := TPrintForm2.Create(application)  ;
  try
       if PrintForm2.ADOData0085.Active then PrintForm2.ADOData0085.Close;
       PrintForm2.ADOData0085.Parameters.ParamValues['vptr'] := 1 ;
       PrintForm2.ADOData0085.Open;

       if PrintForm2.ADOQuery1.Active then PrintForm2.ADOQuery1.Close ;
       PrintForm2.ADOQuery1.Parameters.ParamValues['qte_ptr']:=1;
       PrintForm2.ADOQuery1.Open ;

       if PrintForm2.ADOQuery2.Active then PrintForm2.ADOQuery2.Close ;
        PrintForm2.ADOQuery2.Parameters.ParamValues['qte_ptr']:=1;
        PrintForm2.ADOQuery2.Open ;

       if PrintForm2.ADOQuery3.Active then PrintForm2.ADOQuery3.Close ;
        PrintForm2.ADOQuery3.Parameters.ParamValues['qte_ptr']:=1;
        PrintForm2.ADOQuery3.Open ;

       if PrintForm2.ADOQuery4.Active then PrintForm2.ADOQuery4.Close ;
        PrintForm2.ADOQuery4.Parameters.ParamValues['qte_ptr']:=1;
        PrintForm2.ADOQuery4.Open ;

       if dm.ADOQPrint1.Active then dm.ADOQPrint1.Close ;
       dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR1'] := 1 ;
       dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR2'] := 1;
       dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR3'] := 1 ;
       dm.ADOQPrint1.Parameters.ParamValues['QTE_PTR4'] := 1 ;
       dm.ADOQPrint1.Open;

       if dm.ADOQPrint2.Active then dm.ADOQPrint2.Close ;
       dm.ADOQPrint2.Parameters.ParamValues['QTE_PTR1'] := 1 ;
       dm.ADOQPrint2.Open;

       if not (dm.TDATA0493.Active) then dm.TDATA0493.Open ;
       //SHOWMESSAGE(PrintForm2.ppReport1.Template.FileName );  //
       //PrintForm2.ppReport1.Template.SaveTo := stFile;// 'E:\exec\NIERP\Report\qquote1.rtm';
       //SHOWMESSAGE(PrintForm2.ppReport1.Template.FileName );
       PrintForm2.ppDesigner1.ShowModal ;
  finally
       PrintForm2.Free ;
  end ;
end;

procedure TMainForm1.FormCreate(Sender: TObject);
var
 ZAppName: array[0..127] of char;
 s,title_name:string;
 Found: HWND;
 vprog:pchar;
begin
  inherited;
  hMapFile := CreateFileMapping ($FFFFFFFF,nil,page_ReadWrite,0,100,'xyz2055coimasp20');
  MapFilePointer := MapViewOfFile(hMapFile,File_Map_All_Access,0,0,0);
  S := PChar(MapFilePointer);
  user_ptrs := trim(copy(S,3,pos(' ',s)-3));  //用户指针0005
  vprevs := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1));//权限 1:只读不帶銀碼 ; 2:可写不帶銀碼 ; 3:只读+银码 ; 4:可写+银码
  db_ptrs := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //数据库连接串
  {csi_empl_ptr.Caption := trim(copy(S,1,pos(' ',s)));
  vprev.Caption := trim(copy(S,pos(' ',s)+1,pos(',',s)-pos(' ',s)-1)); //权限
  db_ptr.Caption := trim(copy(S,pos(',',s)+1,length(s)-pos(',',s))); //那一个数据库
}
  title_name:=application.Title;
  self.Caption:='' ;
  application.Title:='OnlyOne'+ IntToStr(HInstance);
  vprog:=pchar(title_name) ;
  strpcopy(ZAppName,vprog) ;
  Found := FindWindow(nil,ZAppName) ;

  if Found <> 0 then
     begin
        ShowWindow(Found, SW_SHOWMINIMIZED) ;
        ShowWindow(Found, SW_SHOWNORMAL) ;
        application.Terminate ;
     end ;

  application.Title := title_name ;
  self.Caption:=title_name ;
  DateSeparator := '-' ;
  ShortDateFormat := 'yyyy-mm-dd' ;

end;

procedure TMainForm1.FormShow(Sender: TObject);
begin
  {
  if user_ptrs = '' then user_ptrs := '550' ;
  if vprevs='' then vprevs := '4';
  //user_ptrs := '183' ;
  { }
  
  if not dm.ADOConnection1.Connected then
      begin
           if trim(vprevs)='' then
               begin
                   showmessage('请在主程序中打开此程序');
                   close;
               end;
           dm.adoconnection1.ConnectionString := db_ptrs;

           try
               if db_ptrs <> '' then
                    dm.Adoconnection1.Connected := true;
           except
               showmessage('连接错，请打开主程序');
               close;
               //application.Terminate;
           end;
      end
  ELSE
      BEGIN
          showmessage('连接出错，请与程序员联系!');
          CLOSE;
      END;
  if vprevs = '' then
      begin
          showmessage('权限为空，请在主程序中打开程序!');
          close;
      end;
  {}
  //最大化窗体
  SELF.WindowState :=wsMaximized;
  self.KeyPreview := true ;
end;

end.
