--ˮ��

--MisDescBegin
x205004_g_ScriptId = 205004
--x205004_g_MissionIdPre =40
x205004_g_MissionId = 44
x205004_g_MissionKind = 11
x205004_g_MissionLevel = 55
x205004_g_ScriptIdNext = {ScriptId = 205005 ,LV = 1 }
x205004_g_Name	="�ͼ�" 
x205004_g_Name2	="������" 
x205004_g_DemandItem ={{id=13010002,num=15}}
x205004_g_noDemandKill ={{id=304,num=1}}	

x205004_g_MissionName="ˮ��"
x205004_g_MissionInfo="    �������ӣ����������ˣ����Ǳ�Χ��ʮ�죬����ʮ���ˣ�������������ȥ�����ǻ��⵽����֮�ֵġ����������������Ҳ�����Σ����������ҡ���ģ�\n \n    �ٲ�̨����������ս��û���κ��˻��ɣ������ɼ�˼����Ϊ½��֮�������ǣ�����˵������ģ���Χ�����ǵģ������򾫱��������ǵĻ����Ӳ�����ǧ�ˡ����㣬�����ҵ���˼�𣿱����������ң���Ҳû��ʲô�ð취������Ψһ�����ģ�������û��֮ǰ������Ϊ��Ҷ������飡\n \n��Ҫ�ռ�ˮ�ң���ˮ���͵������������Щ#c0080C0ˮ��#W�����ԴӶ��洦��#R����ʿ��#W�����õ���"  --��������
x205004_g_MissionTarget="    #R����ʿ��#W�����аͼ�Ҫ��#c0080C0ˮ��#W�����ռ�15��ˮ�ң���������#G������#W��"		
x205004_g_MissionComplete="    15��ˮ�ң�һ�����٣�лл��İ�����"					--�������npc˵���Ļ�
x205004_g_ContinueInfo="    ��ɳĮ�ˮ�Ȼƽ��������Щˮ�ң�������װˮ�ġ�"
--������
x205004_g_MoneyBonus = 10000
--�̶���Ʒ���������8��
x205004_g_ItemBonus={}

--��ѡ��Ʒ���������8��
x205004_g_RadioItemBonus={}

--MisDescEnd
x205004_g_ExpBonus = 1000
--**********************************

--������ں���

--**********************************

function x205004_OnDefaultEvent(sceneId, selfId, targetId)	--����������ִ�д˽ű�

	--����г�����
	if x205004_CheckPushList(sceneId, selfId, targetId) <= 0 then
		return
	end

	--����ѽӴ�����
	if IsHaveMission(sceneId,selfId, x205004_g_MissionId) > 0 then
		if x205004_CheckSubmit(sceneId, selfId, targetId) <= 0 then
                        BeginEvent(sceneId)
			AddText(sceneId,"#Y"..x205004_g_MissionName)
			AddText(sceneId,x205004_g_ContinueInfo)
		        AddText(sceneId,"#Y����Ŀ��#W") 
			AddText(sceneId,x205004_g_MissionTarget) 
			AddText(sceneId,format("\n    ˮ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x205004_g_DemandItem[1].id),x205004_g_DemandItem[1].num ))
			EndEvent()
			DispatchEventList(sceneId, selfId, targetId)
		end

		     
                if x205004_CheckSubmit(sceneId, selfId, targetId) > 0 then
                     BeginEvent(sceneId)
                     AddText(sceneId,"#Y"..x205004_g_MissionName)
		     AddText(sceneId,x205004_g_MissionComplete)
		     --AddText(sceneId,"#Y��Ҫ��Ʒ#W") 
		     --for i, item in x205004_g_DemandItem do  
		     --AddItemBonus(sceneId, item.id, item.num)
		     --end
		     AddMoneyBonus(sceneId, x205004_g_MoneyBonus)
		     EndEvent()
                     DispatchMissionContinueInfo(sceneId, selfId, targetId, x205004_g_ScriptId, x205004_g_MissionId)
                end

        elseif x205004_CheckAccept(sceneId, selfId, targetId) > 0 then
	    	
		--�����������ʱ��ʾ����Ϣ
		BeginEvent(sceneId)
		AddText(sceneId,"#Y"..x205004_g_MissionName)
                AddText(sceneId,x205004_g_MissionInfo) 
		AddText(sceneId,"#Y����Ŀ��#W") 
		AddText(sceneId,x205004_g_MissionTarget) 
		AddMoneyBonus(sceneId, x205004_g_MoneyBonus)	
		EndEvent()
		
		DispatchMissionInfo(sceneId, selfId, targetId, x205004_g_ScriptId, x205004_g_MissionId)
        end
	
end



--**********************************

--�о��¼�

--**********************************

function x205004_OnEnumerate(sceneId, selfId, targetId)


	--��������ɹ��������
	if IsMissionHaveDone(sceneId, selfId, x205004_g_MissionId) > 0 then
		return 
	end
	--����ѽӴ�����
	if  x205004_CheckPushList(sceneId, selfId, targetId) > 0 then
		AddNumText(sceneId, x205004_g_ScriptId, x205004_g_MissionName)
	end
	
end



--**********************************

--����������

--**********************************

function x205004_CheckAccept(sceneId, selfId, targetId)

	if (GetName(sceneId,targetId)==x205004_g_Name) then 
					return 1
	end
	return 0
end


--**********************************

--���鿴����

--**********************************

function x205004_CheckPushList(sceneId, selfId, targetId)
        if (sceneId==5) then
        	if (GetName(sceneId,targetId)==x205004_g_Name) then
        	            if IsHaveMission(sceneId,selfId, x205004_g_MissionId)<= 0 then
        	            	return 1
        	        end
        	end
		if (GetName(sceneId,targetId)==x205004_g_Name2) then
			    if IsHaveMission(sceneId,selfId, x205004_g_MissionId) > 0 then
			    	return 1
        	            end
        	end
        end
        return 0
	
end

--**********************************

--����

--**********************************

function x205004_OnAccept(sceneId, selfId)

	                                                  
		        BeginEvent(sceneId)
			AddMission( sceneId, selfId, x205004_g_MissionId, x205004_g_ScriptId, 1, 0, 0)
			AddText(sceneId,"��������"..x205004_g_MissionName) 
			EndEvent()
			DispatchMissionTips(sceneId, selfId)                   
	                                                                     
	     
end



--**********************************

--����

--**********************************

function x205004_OnAbandon(sceneId, selfId)

	--ɾ����������б��ж�Ӧ������
	DelMission(sceneId, selfId, x205004_g_MissionId)
	for i, item in x205004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
	end

end



--**********************************

--����Ƿ�����ύ

--**********************************

function x205004_CheckSubmit( sceneId, selfId, targetId)

	if LuaFnGetItemCount(sceneId,selfId,x205004_g_DemandItem[1].id) == x205004_g_DemandItem[1].num then
	        return 1
	end
	return 0

end



--**********************************

--�ύ

--**********************************

function x205004_OnSubmit(sceneId, selfId, targetId, selectRadioId)

	if DelMission(sceneId, selfId, x205004_g_MissionId) > 0 then
	
		MissionCom(sceneId, selfId, x205004_g_MissionId)
		AddExp(sceneId, selfId, x205004_g_ExpBonus)
		AddMoney(sceneId, selfId, x205004_g_MoneyBonus)
		for i, item in x205004_g_RadioItemBonus do
	        if item.id == selectRadioId then
	        item={{selectRadioID, 1}}
	        end
	        end

		for i, item in x205004_g_DemandItem do
		DelItem(sceneId, selfId, item.id, item.num)
		end
		CallScriptFunction( x205004_g_ScriptIdNext.ScriptId, "OnDefaultEvent",sceneId, selfId, targetId )
	end
	

	
end



--**********************************

--ɱ����������

--**********************************

function x205004_OnKillObject(sceneId, selfId, objdataId)
	 if IsHaveMission(sceneId, selfId, x205004_g_MissionId) >= 0 then                                       
       		 if objdataId == x205004_g_noDemandKill[1].id then 
       		    if LuaFnGetItemCount(sceneId,selfId,x205004_g_DemandItem[1].id) < x205004_g_DemandItem[1].num then
       		         if random(1,100)>20 then
       		        	 BeginAddItem(sceneId)                                                    
				 AddItem( sceneId,x205004_g_DemandItem[1].id, 1 )             
				 ret = EndAddItem(sceneId,selfId)                                 
		        	 if ret > 0 then                                                  
		        	 	BeginEvent(sceneId)
				 	AddText(sceneId,format("ˮ��   %d/%d", LuaFnGetItemCount(sceneId,selfId,x205004_g_DemandItem[1].id)+1,x205004_g_DemandItem[1].num )) 
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

function x205004_OnEnterArea(sceneId, selfId, zoneId)

end



--**********************************

--���߸ı�

--**********************************

function x205004_OnItemChanged(sceneId, selfId, itemdataId)

end

