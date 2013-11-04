--�ö���������

--MisDescBegin
x201003_g_ScriptId = 201003
x201003_g_MissionIdPre =84
x201003_g_MissionId = 85
x201003_g_MissionKind = 2
x201003_g_MissionLevel = 10
--x201003_g_ScriptIdNext = {ScriptId = 201002 ,LV = 1 }
x201003_g_Name	="�ö���"
x201003_g_DemandItem ={}
x201003_g_DemandKill ={{id=340,num=20}}

x201003_g_MissionName="�ö���������"
x201003_g_MissionInfo="    ��ľ�滹������֪����һ���������ҵġ���\n \n    ���ǲ��ܾ��������ȥ����Щ#R��������ʦ#W��һȺħ��һȺ���˲��¹�ͷ�Ķ�ħ��\n \n    "  --��������
x201003_g_MissionInfo2="�����𸽽�����Щ��ʦ����ʵ�ڲ����ģ�"
x201003_g_MissionTarget="    ���𸽽���20��#R��������ʦ#W����ȥ����#G�ö���#W��"		                                                                                               
x201003_g_MissionComplete="    лл�㣬���ǰ�ȫ�ˣ�"					--�������npc˵���Ļ�
x201003_g_ContinueInfo="    ����Щ��ʦ�ڣ������Ӳ���ȥ�ģ�һ��Ҫ���������ǡ�"
--������
x201003_g_MoneyBonus = 2
--�̶���Ʒ���������8��
x201003_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x201003_g_RadioItemBonus={{id=10206001,num=1},{id=10236001,num=1},{id=10266002,num=1}}
--MisDescEnd
x201003_g_ExpBonus = 80
--**********************************

--������ں���

--**********************************

function x201003_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x201003_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x201003_g_MissionId) > 0 then
	misIndex = GetMissionIndexByID(sceneId,selfId,x201003_g_MissionId)
		if x201003_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x201003_g_MissionName)
			AddText(sceneId,x201003_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x201003_g_MissionTarget) 
			AddText(sceneId,format("\n    ɱ����������ʦ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201003_g_DemandKill[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x201003_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x201003_g_MissionName)
		     AddText(sceneId,x201003_g_MissionComplete)
		     AddMoneyBonus(sceneId, x201003_g_MoneyBonus)
		     for i, item in x201003_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	             end
		     for i, item in x201003_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	             end
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x201003_g_ScriptId, x201003_g_MissionId)
                end

        elseif x201003_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x201003_g_MissionName)
                AddText(sceneId,x201003_g_MissionInfo..GetName(sceneId, selfId)..x201003_g_MissionInfo2) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x201003_g_MissionTarget) 
		AddMoneyBonus(sceneId, x201003_g_MoneyBonus)
		for i, item in x201003_g_ItemBonus do
	             	AddItemBonus(sceneId, item.id, item.num)
	        end
		for i, item in x201003_g_RadioItemBonus do
	            	 AddRadioItemBonus(sceneId, item.id, item.num)
	        end		
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x201003_g_ScriptId, x201003_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x201003_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x201003_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x201003_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x201003_g_ScriptId, x201003_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x201003_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x201003_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x201003_CheckPushList(sceneId, selfId, targetId)
	if (sceneId==1) then
		if IsMissionHaveDone(sceneId, selfId, x201003_g_MissionIdPre) > 0 then
			return 1
   	end
  end
        return 0
	
end

--**********************************

--����

--**********************************

function x201003_OnAccept(sceneId, selfId)

	        BeginEvent(sceneId)
		AddMission( sceneId, selfId, x201003_g_MissionId, x201003_g_ScriptId, 1, 0, 0)
		AddText(sceneId,"��������"..x201003_g_MissionName) 
		EndEvent()
		DispatchMissionTips(sceneId, selfId)
		                                               
	     
end



--**********************************

--����

--**********************************

function x201003_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x201003_g_MissionId)
	for i, item in x201003_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x201003_CheckSubmit( sceneId, selfId, targetId)
	misIndex = GetMissionIndexByID(sceneId,selfId,x201003_g_MissionId)
	if GetMissionParam(sceneId,selfId,misIndex,0) == x201003_g_DemandKill[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x201003_OnSubmit(sceneId, selfId, targetId, selectRadioId)

		BeginAddItem(sceneId)                                                    
			for i, item in x201003_g_ItemBonus do                    
				AddItem( sceneId,item.id, item.num )             
			end                                                      
			for i, item in x201003_g_RadioItemBonus do               
				if item.id == selectRadioId then                 
					AddItem( sceneId,item.id, item.num )     
				end                                              
			end                                                      
		ret = EndAddItem(sceneId,selfId)                                 
		if ret > 0 then                                                  
		  ret = DelMission( sceneId, selfId, x201003_g_MissionId ) 
			if ret > 0 then                                   
				MissionCom( sceneId,selfId, x201003_g_MissionId )
				AddExp(sceneId, selfId, x201003_g_ExpBonus)   
	                        AddMoney(sceneId, selfId, x201003_g_MoneyBonus)
	                        AddItemListToHuman(sceneId,selfId)
			end                                               
		else                                                             
		--������û�мӳɹ�                                             
			BeginEvent(sceneId)                                      
				AddText(sceneId,"��Ʒ����������������������");                        
			EndEvent(sceneId)                                        
			DispatchMissionTips(sceneId,selfId)                      
		end   
		--CallScriptFunction( x201003_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )

	

	
end



--**********************************

--ɱ����������

--**********************************

function x201003_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x201003_g_MissionId) > 0 then 
	 misIndex = GetMissionIndexByID(sceneId,selfId,x201003_g_MissionId)  
	 num = GetMissionParam(sceneId,selfId,misIndex,0) 
	 	 if objdataId == x201003_g_DemandKill[1].id then 
       		    if num < x201003_g_DemandKill[1].num then
       		    	 SetMissionByIndex(sceneId,selfId,misIndex,0,num+1)
       		         BeginEvent(sceneId)
			 AddText(sceneId,format("ɱ����������ʦ   %d/%d", GetMissionParam(sceneId,selfId,misIndex,0),x201003_g_DemandKill[1].num )) 
			 EndEvent()
			 DispatchMissionTips(sceneId, selfId)
		    end
       		 end
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x201003_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x201003_OnItemChanged(sceneId, selfId, itemdataId)

end

