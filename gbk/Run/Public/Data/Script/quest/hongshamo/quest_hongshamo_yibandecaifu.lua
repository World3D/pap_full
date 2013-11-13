--һ��ĲƸ�

--MisDescBegin
x205011_g_ScriptId = 205011
x205011_g_MissionIdPre =50
x205011_g_MissionId = 51
x205011_g_MissionKind = 11
x205011_g_MissionLevel = 55
x205011_g_ScriptIdNext = {ScriptId = 205012 ,LV = 1 }
x205011_g_Name	="������" 
x205011_g_DemandItem ={{id=13010010,num=1}}
x205011_g_noDemandKill ={{id=308,num=1}}	

x205011_g_MissionName="һ��ĲƸ�"
x205011_g_MissionInfo="   ��л����ҽ����һ��ͷ�۵����⣡�����ҽ���һ�£����ǻ�����ģ�۹������ӣ��ҽ������������룬����Ӧ���ܳ�Ϊ�ܺõ����ѡ�\n \n    �����ٰ��ҽ���ڶ��������𣿵�Ȼ��������˵����������׾ٵ����顣�������ģ����������Ѿ�����ˣ��������������ĲƱ���û�ж������������ܰ��ҰѲƱ���أ��һ������ĲƱ�����һ�룡"  --��������
x205011_g_MissionTarget="    ����#G������#Wɱ��#R����ආ�#W���#c0080C0�������ı���#W"		
x205011_g_MissionComplete="    ���������Ҷ�ʧ�Ѿõı��䣡"					--�������npc˵���Ļ�
x205011_g_ContinueInfo="    ��������������һ��Ҫ��֮����졣"
--������
x205011_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205011_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205011_g_RadioItemBonus={}

--MisDescEnd
x205011_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205011_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205011_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205011_g_MissionId) > 0 then
		if x205011_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x205011_g_MissionName)
			AddText(sceneId,x205011_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x205011_g_MissionTarget) 
			AddText(sceneId,format("\n    �������ı���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x205011_g_DemandItem[1].id),x205011_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x205011_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205011_g_MissionName)
		     AddText(sceneId,x205011_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in pairs(x205011_g_DemandItem) do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x205011_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205011_g_ScriptId, x205011_g_MissionId)
                end

        elseif x205011_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205011_g_MissionName)
                AddText(sceneId,x205011_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205011_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205011_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205011_g_ScriptId, x205011_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205011_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205011_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205011_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205011_g_ScriptId, x205011_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205011_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205011_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205011_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==5) then
        	if IsMissionHaveDone(sceneId, selfId, x205011_g_MissionIdPre) > 0 then
        		return 1
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205011_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x205011_g_MissionId, x205011_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x205011_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x205011_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205011_g_MissionId)
	for i, item in pairs(x205011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205011_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x205011_g_DemandItem[1].id) == x205011_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205011_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205011_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205011_g_MissionId)
		AddExp(sceneId, selfId, x205011_g_ExpBonus)
		AddMoney(sceneId, selfId, x205011_g_MoneyBonus)
		for i, item in pairs(x205011_g_RadioItemBonus) do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in pairs(x205011_g_DemandItem) do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x205011_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205011_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x205011_g_MissionId) >= 0 then                                       
       		 if objdataId == x205011_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x205011_g_DemandItem[1].id) < x205011_g_DemandItem[1].num then
       		    	if random(1,100)>95 then
       		         	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x205011_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("�������ı���   %d/%d", LuaFnGetItemCount(sceneId,selfId,x205011_g_DemandItem[1].id)+1,x205011_g_DemandItem[1].num )) 
				 	EndEvent()
				 	DispatchMissionTips(sceneId, selfId)
				 	AddItemListToHuman(sceneId,selfId) 
		        	 else                                                             
		        	 	BeginEvent(sceneId)                                      
				     	AddText(sceneId,"��Ʒ��������")                    
				        EndEvent(sceneId)                                        
				        DispatchMissionTips(sceneId,selfId) 
				 end
			end                     
		    end
       		 end
       		 
       		 
      end  

end



--**********************************

--���������¼�

--**********************************

function x205011_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205011_OnItemChanged(sceneId, selfId, itemdataId)

end

